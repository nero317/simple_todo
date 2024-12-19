# Flutter TodoList 앱에서 사용된 지식 정리

## 1. Flutter 위젯 기본 지식

### StatelessWidget과 StatefulWidget

- **StatelessWidget**: 상태가 변하지 않는 UI를 정의하는 데 사용.
  - 예: `MainApp`, `TodoList`.
- **StatefulWidget**: 상태 변화가 필요한 UI를 정의.
  - 예: `HomePage`.
  - 상태 관리를 위해 `setState()` 메서드 사용.

---

## 2. 주요 위젯과 기능

### MaterialApp

- Flutter 앱의 루트 위젯으로 사용.
- 주요 속성:
  - `home`: 기본 화면 위젯 지정.
  - `theme`: 앱 전역 테마 설정.
  - `debugShowCheckedModeBanner`: 디버그 모드 배너 표시 여부.

### Scaffold

- Flutter의 화면 기본 구조를 제공하는 위젯.
- 주요 속성:
  - `appBar`: 상단 앱바 정의.
  - `body`: 화면의 주요 내용을 배치.
  - `floatingActionButton`: 플로팅 액션 버튼 정의.

### ListView.builder

- 긴 리스트를 효율적으로 렌더링하는 위젯.
- 주요 속성:
  - `itemCount`: 리스트 항목의 개수.
  - `itemBuilder`: 각 항목을 생성하는 콜백 함수.

### Slidable

- 항목을 스와이프하여 추가 기능(예: 삭제)을 제공.
- 주요 구성 요소:
  - `ActionPane`: 스와이프 동작 정의.
  - `SlidableAction`: 스와이프 후 나타나는 버튼.

### Checkbox

- 체크박스를 렌더링하는 위젯.
- 주요 속성:
  - `value`: 체크 여부.
  - `onChanged`: 체크 상태가 변경될 때 실행되는 콜백 함수.

---

## 3. Flutter의 상태 관리

### setState

- `StatefulWidget`에서 UI를 갱신할 때 사용하는 메서드.
- 예: 항목 추가, 삭제, 체크 상태 변경 시 호출.

```dart
setState(() {
  toDoList.add([_controller.text, false]);
});
```

- **장점**: 간단한 상태 관리에 적합.
- **단점**: 상태 관리가 복잡해지면 성능 저하 및 유지보수 어려움 발생.

### TextEditingController

- 텍스트 필드에서 입력값을 관리하는 데 사용.
- 주요 메서드:
  - `text`: 현재 입력값에 접근.
  - `clear()`: 입력값 초기화.

---

## 4. 스타일링과 테마

### BoxDecoration

- `Container`의 외형을 꾸미는 데 사용.
- 주요 속성:
  - `color`: 배경색 설정.
  - `borderRadius`: 테두리 곡률 설정.

### ThemeData

- 앱의 전역 스타일을 설정.
- 주요 속성:
  - `fontFamily`: 앱에서 사용할 기본 폰트.

---

## 5. Flutter 개발 팁

### 코드 재사용성

- 재사용 가능한 컴포넌트를 정의하여 유지보수와 확장성 증가.
  - 예: `TodoList` 위젯은 반복적으로 사용 가능.

### Slidable과 같은 제스처 위젯 사용

- 직관적인 사용자 경험을 제공.
- **주의점**: 모든 사용자가 제스처를 직관적으로 이해하지 못할 수 있으므로 대체 UI도 제공.

### 상태 관리 도구 선택

- 단순한 상태 관리에는 `setState`를 사용.
- 앱이 복잡해지면 `Provider`, `Riverpod`, `Bloc` 등을 고려.

---

## 6. 이 프로젝트에서 구현된 주요 기능

### Todo 항목 추가

- `TextField`와 `FloatingActionButton`을 조합하여 새 항목을 추가.
- 사용된 기술:
  - `TextEditingController`로 텍스트 입력값 관리.
  - `setState()`로 리스트 갱신.

### Todo 항목 삭제

- `Slidable` 위젯과 `deleteTask` 함수로 구현.
- 사용된 기술:
  - `ActionPane`에서 삭제 버튼 정의.
  - `setState()`로 리스트에서 항목 제거.

### Todo 상태 변경

- 체크박스와 `checkBoxChanged` 함수로 구현.
- 사용된 기술:
  - `Checkbox`의 `onChanged` 콜백 사용.
  - `setState()`로 완료 상태 업데이트.

---

## 7. 학습과 활용 포인트

### 이 앱에서 배운 점

- Flutter의 기본 위젯 사용법.
- 상태 관리의 기본 개념.
- Slidable과 같은 상호작용 위젯의 활용.

### 개선점 및 확장 아이디어

- **데이터 저장**: 현재 앱은 데이터가 메모리에만 저장되므로, `SharedPreferences`나 SQLite로 영구 저장 가능.
- **상태 관리 도구 사용**: 앱이 커질 경우 `Provider`를 도입해 상태를 분리.
- **UI 향상**: 추가 애니메이션이나 더 다양한 테마 추가.
