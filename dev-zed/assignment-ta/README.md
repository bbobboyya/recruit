# ZIGBANG ZED TA Assignment

## 과제 제출 방법
- 과제를 완료하신 후 아래 제시된 절차대로 과제를 제출하시기 바랍니다.
>1) fork 기능으로 개인 github 계정에 저장소 생성
>![image](https://user-images.githubusercontent.com/52955606/123530093-b8479380-d731-11eb-9f65-a1da28a683e4.png)
>2) 작업을 하신 후 fork하신 저장소에 commit & push
>3) 해당 저장소의 url을 첨부하여 채용 담당자분께 이메일 제출

- **(중요)과제 작성시 다음 제약조건을 준수하여 주시기 바랍니다.**
```
1) 유니티 2019.4.21f1 으로 작성할것
2) URP를 사용할것 
3) 라이트맵을 사용하지 말것
4) 애셋의 추가적인 용량은 30MB 이하로 사용할것
5) 쉐이더는 자유롭게 작성하되, ShaderLab 및 CG/HLSL를 사용한 쉐이더를 하나 이상 포함할것
```

## 과제 설명
프로젝트내부에는 2개의 Scene이 존재합니다.
### 1. Danji.unity
![image](https://user-images.githubusercontent.com/52955606/122860977-a5137d00-d359-11eb-87b8-5cc82b3ff6f4.png)
- 직방에서 사용하고 있는 단지를 obj 파일로 익스포트하고 이를 프리팹으로 임포트한 Scene입니다.
- 오브젝트의 구조는 다음과 같습니다
 
![image](https://user-images.githubusercontent.com/52955606/122861078-cf653a80-d359-11eb-9fef-9e59731129a7.png)
```
 - Danji: 아파트 단지 건물
 - Items: 아파트 단지 내에 매물에 해당하는 세대
 - BuildingFloors: 건물과 지면 사이에 존재하는 바닥면 폴리곤
 - AroundBuildings: 아파트 단지를 제외한 주변 지역 건물 
 - AroundDanjis: 주변에 존재하는 다른 아파트 단지
 - Ground: 지형 폴리곤
```
- 오브젝트들의 용도 및 가시성을 고려하여 머테리얼 및 쉐이더를 제작하고, 적절한 라이팅을 배치하여 완성된 씬을 만들어 제출하세요.

#### 적용 예시
![image](https://user-images.githubusercontent.com/52955606/123564606-feb1f680-d7f4-11eb-847b-ef81d660fbdd.png)

- Tip: 예시 화면에서 지형에 사용된 텍스쳐 이미지 경로 - /Assets/Materials/GroundMap.tif


### 2. Room.unity
![image](https://user-images.githubusercontent.com/52955606/122860915-83b29100-d359-11eb-9f92-8e96eabb4adf.png)
- 직방에서 사용하고 있는 실내 평면도 모델링입니다. 해당 모델링은 자동생성으로 만들어지며, 머테리얼도 자동으로 반영됩니다.
- 머테리얼은 사전에 주어진 24개로 제한됩니다.

![image](https://user-images.githubusercontent.com/52955606/123564979-4c7b2e80-d7f6-11eb-9c7e-eee4c9a6d7eb.png)

- 주어진 24개의 머테리얼을 변경하거나 새로운 쉐이더를 적용하고, 적절한 라이팅을 배치하여 씬의 퀄리티를 높여 보세요. 
- **머테리얼 수의 추가는 불가능하며, 기존 머테리얼의 수정 또는 교체만 가능합니다.**

## 과제 관련 코멘트
- 여기에 과제 관련하여 코멘트 하실 사항이 있으면 작성해주세요.
- 작업 시의 주안점, 과정, 디자인 의도 등을 자유롭게 기술해주시면 됩니다.


#--과제 코멘트--

dnaji.unity씬
오브젝트가 바닥에 가까울수록 어둡게 표현되도록 쉐이더 제작.

Room.unity씬
벽지를 수정할 수 있도록 쉐이더제작, danji쉐이더를 응용하여 바닥에 가까울수록 어둡게 표현되도록 제작(메터리얼 내 조정 가능)
해당씬의 거실바닥을 반투명으로 수정하고 static오브젝트를 반대로 복사하여 리플렉션(반사)을 구현.
