Shader "Shader Graphs/Ground_shader_HLSL"
{
    Properties
    {	
        _MainTex ("Texture", 2D) = "white" {}
		_Tile("TileOffset", Vector) = (0,0,0,0)
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" "RenderPipeline"="UniversalRenderPipeline"}

        Pass
        {
            HLSLPROGRAM
			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x
            #pragma vertex vert 
            #pragma fragment frag noshadow noambient novertexlights nolightmap nodirlightmap nofog nometa noforwardadd nolppv noshadowmask


            //#include "UnityCG.cginc"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS_CASCADE
			#pragma multi_compile _ _SHADOWS_SOFT

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
				float3 worldPos : TEXCOORD1;
				float3 normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
				float3 normal : NORMAL;
				float4 shadow : TEXCOORD1;
				float3 worldPos : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
            };

			CBUFFER_START(UnityPerMaterial);

            TEXTURE2D(_MainTex);
            SAMPLER(sampler_MainTex);
			float4 _MainTex_ST;
			float4 _Tile;


			CBUFFER_END

            v2f vert (appdata v)
            {
                v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				
				VertexPositionInputs vertexInput = GetVertexPositionInputs(v.vertex.xyz);
				o.shadow = GetShadowCoord(vertexInput);
				o.worldPos = TransformObjectToWorld(v.vertex.xyz);
				o.normal = TransformObjectToWorldNormal(v.normal);
				o.vertex = TransformObjectToHClip(v.vertex.xyz);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
				
                return o;
            }

            half4 frag (v2f i) : SV_Target
            {
				UNITY_SETUP_INSTANCE_ID(i);
				
				float4 shadowCoord = TransformWorldToShadowCoord(i.worldPos);
				Light mainLight = GetMainLight(i.shadow);

				half shadow = mainLight.shadowAttenuation;

				i.uv = i.worldPos.rb*0.0001f;
				i.uv.x += _Tile.x*0.0005f;
				i.uv.y += _Tile.y*0.0005f;
				i.uv.x *= _Tile.z*0.02f;
				i.uv.y *= _Tile.w*0.02f;

                half4 col = SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, i.uv);

				float NdotL = saturate(dot(_MainLightPosition.xyz, i.normal));
				half3 amb = SampleSH(i.normal);

				col.rgb *= NdotL * _MainLightColor.rgb+ amb;

                return col;
            }
            ENDHLSL
		}
	} 
}
