# 🎮 MVC 멀티플레이어 몬스터 피하기 게임

MVC 패턴으로 리팩토링된 실시간 멀티플레이어 게임입니다. 테스트 가능한 구조로 설계되어 유지보수성과 확장성을 극대화했습니다.

## 🌟 주요 특징

- **🏗️ MVC 아키텍처**: 관심사 분리로 깔끔한 코드 구조
- **🧪 테스트 가능**: 자체 테스트 프레임워크로 모든 컴포넌트 테스트
- **🔗 실시간 멀티플레이어**: BroadcastChannel API 사용
- **📱 반응형 디자인**: 모바일/데스크톱 모두 지원
- **🎯 ES6 모듈**: 최신 JavaScript 표준 사용
- **⚡ 고성능**: 60fps 렌더링, 효율적인 충돌 감지

## 📁 파일 구조

```
game/
├── index.html          # 메인 HTML 파일
├── main.js             # 애플리케이션 진입점
├── models.js           # 게임 모델 (M)
├── view.js             # 게임 뷰 (V)
├── controller.js       # 게임 컨트롤러 (C)
├── network.js          # 네트워크 서비스
├── test.js             # 테스트 프레임워크
└── README.md           # 프로젝트 문서
```

## 🚀 빠른 시작

### 방법 1: GitHub Pages 배포 (권장)

1. **GitHub 저장소 생성**

   ```bash
   # 새 저장소 생성 후
   git clone https://github.com/yourusername/your-repo-name.git
   cd your-repo-name
   ```

2. **파일 업로드**

   - 모든 게임 파일을 저장소 루트에 복사
   - `git add .` && `git commit -m "Initial commit"` && `git push`

3. **GitHub Pages 활성화**

   - GitHub 저장소 → Settings → Pages
   - Source: "Deploy from a branch"
   - Branch: "main" 선택 → Save

4. **접속**
   ```
   https://yourusername.github.io/your-repo-name/
   ```

### 방법 2: 로컬 개발

ES6 모듈을 사용하므로 로컬 개발 시에만 웹서버가 필요합니다:

```bash
# Python 3
python -m http.server 8000

# Node.js (http-server)
npx http-server

# VS Code Live Server 확장 사용
```

**로컬 접속**: `http://localhost:8000`

### 🎮 게임 플레이

- 닉네임을 입력하고 "게임 참가" 클릭
- 친구들과 함께 플레이하려면 URL 공유
- 화살표 키 또는 WASD로 이동
- 스페이스바로 총 발사

## 🏗️ 아키텍처 설명

### Model (models.js)

게임의 데이터와 비즈니스 로직을 담당합니다.

```javascript
// 주요 클래스들
- GameState: 전체 게임 상태 관리
- Player: 플레이어 모델
- Monster: 몬스터 기본 클래스
  - Observer: 추적형 몬스터
  - Rusher: 돌진형 몬스터
- Bullet: 총알 모델
- Item: 아이템 모델
```

### View (view.js)

렌더링과 UI 업데이트를 담당합니다.

```javascript
// 주요 기능들
- 캔버스 렌더링
- UI 상태 관리
- 플레이어 목록 업데이트
- 게임 오버 화면
- 미니맵 및 디버그 정보
```

### Controller (controller.js)

사용자 입력과 게임 로직을 제어합니다.

```javascript
// 주요 기능들
- 입력 처리
- 게임 루프 관리
- 충돌 감지
- 몬스터 스폰
- 네트워크 메시지 처리
```

### Network Service (network.js)

멀티플레이어 네트워킹을 담당합니다.

```javascript
// 주요 기능들
- BroadcastChannel API 사용
- 실시간 동기화
- 호스트/클라이언트 관리
- 메시지 브로드캐스팅
- 연결 상태 관리
```

## 🧪 테스트 시스템

### 테스트 실행

게임에서 "테스트 실행" 버튼을 클릭하거나:

```javascript
// 콘솔에서 실행
runTests();

// 특정 스위트만 실행
testFramework.runSuite('Models');

// 패턴 매칭으로 실행
testFramework.runTestsMatching('Player');
```

### 테스트 작성 예시

```javascript
// describe로 테스트 스위트 정의
testFramework.describe('Player Tests', () => {
  // beforeEach로 각 테스트 전 설정
  testFramework.beforeEach(() => {
    // 초기화 코드
  });

  // it으로 개별 테스트 정의
  testFramework.it('플레이어 생성', () => {
    const player = new Player('test1', 'TestPlayer', 100, 100, '#ff0000');
    testFramework.assertEqual(player.name, 'TestPlayer');
    testFramework.assertTrue(player.alive);
  });
});
```

### 사용 가능한 Assertion 메서드

```javascript
// 기본 검증
testFramework.assert(condition, message)
testFramework.assertEqual(actual, expected)
testFramework.assertNotEqual(actual, unexpected)
testFramework.assertTrue(condition)
testFramework.assertFalse(condition)

// 타입 검증
testFramework.assertNull(value)
testFramework.assertUndefined(value)
testFramework.assertType(value, 'string')

// 배열/객체 검증
testFramework.assertContains(array, value)
testFramework.assertDeepEqual(obj1, obj2)

// 예외 검증
testFramework.assertThrows(() => { throw new Error('test'); })
testFramework.assertThrowsAsync(async () => { ... })

// 수치 검증
testFramework.assertInRange(value, min, max)
testFramework.assertAlmostEqual(3.14159, 3.14, 0.01)
```

## 🎮 게임 메커니즘

### 플레이어 시스템

- **이동**: WASD 또는 화살표 키
- **발사**: 스페이스바 (자동 조준)
- **레벨업**: 점수에 따라 자동 레벨업
- **능력 강화**: 레벨에 따라 발사 속도, 관통력 증가

### 몬스터 AI

- **Observer**: 플레이어를 추적하는 기본 몬스터
- **Rusher**: 빠른 속도로 돌진하는 몬스터
- **Patroller**: 일정 범위를 순찰하는 몬스터
- **Shooter**: 원거리 공격을 하는 몬스터

### 아이템 시스템

- **Shield**: 5초간 무적 상태
- **Speed**: 이동 속도 증가
- **Power**: 점수 보너스

## 🔧 개발자 도구

### 디버그 모드 활성화

```javascript
// URL 파라미터로
//localhost:8000?debug=true

// 콘솔에서
http: game.enableDebug();

// 키보드 단축키
Ctrl + D;
```

### 디버그 기능들

- **성능 모니터링**: FPS, 메모리 사용량
- **네트워크 통계**: 대역폭, 메시지 수
- **게임 상태**: 엔티티 수, 플레이어 정보
- **테스트 실행**: 실시간 테스트 결과

### 콘솔 명령어

```javascript
// 게임 상태 조회
game.getStats();

// 네트워크 정보
gameController.network.getNetworkStats();

// 특정 테스트 실행
testFramework.runSuite('Models');

// 게임 리셋 (호스트만)
gameController.resetGame();

// 레벨 변경 (호스트만)
gameController.changeLevel(5);
```

## 🌐 멀티플레이어 가이드

### GitHub Pages에서의 실제 멀티플레이어

GitHub Pages에 배포하면 **진짜 온라인 멀티플레이어**가 가능합니다!

1. **방 생성**: 첫 번째 플레이어가 자동으로 호스트가 됩니다
2. **링크 공유**: 생성된 URL을 친구들에게 공유
   ```
   https://yourusername.github.io/your-repo-name/?room=room_12345
   ```
3. **실시간 플레이**: 친구들이 링크로 접속하면 같은 방에서 실시간 플레이!

### BroadcastChannel 작동 방식

- **같은 도메인**: `yourusername.github.io`에서 접속한 모든 사용자가 연결
- **실시간 동기화**: 이동, 공격, 충돌이 즉시 동기화
- **서버 불필요**: P2P 방식으로 서버 비용 없음

### 로컬 테스트

로컬에서는 **같은 브라우저의 여러 탭**에서만 멀티플레이어가 작동합니다:

```bash
# 로컬 서버 실행 후
http://localhost:8000
http://localhost:8000  # 새 탭에서 열기
```

### 호스트 권한

- 게임 레벨 조정
- 게임 리셋
- 몬스터 스폰 제어
- 충돌 감지 관리

### 네트워크 동기화

- **플레이어 상태**: 60fps로 실시간 동기화
- **게임 월드**: 호스트가 20fps로 브로드캐스트
- **즉시 이벤트**: 총알 발사, 충돌 등 즉시 전파

## 🔧 커스터마이징

### 새로운 몬스터 추가

```javascript
// models.js에 새 클래스 추가
class NewMonster extends Monster {
  constructor(x, y) {
    super(x, y, 'new_monster');
    this.size = 20;
    this.speed = 2;
    this.color = '#ff00ff';
  }

  ai() {
    // 새로운 AI 로직 구현
  }
}

// controller.js의 selectMonsterType()에 추가
if (averageLevel >= 10) {
  monsterTypes.push(NewMonster);
  weights = [0.3, 0.3, 0.2, 0.2];
}
```

### 새로운 아이템 추가

```javascript
// models.js의 Item.applyEffect()에 추가
case 'new_item':
    player.someNewProperty = true;
    break;

// view.js에 렌더링 로직 추가
case 'new_item':
    this.drawNewItem(screenX, screenY, item.size);
    break;
```

### UI 커스터마이징

```css
/* index.html의 <style> 태그에서 수정 */
.ui {
  background: rgba(0, 0, 0, 0.9); /* 더 진한 배경 */
  border: 2px solid #ff0000; /* 빨간 테두리 */
}
```

## 📱 모바일 지원

### 터치 컨트롤 (추가 구현 필요)

```javascript
// 터치 이벤트 처리 예시
canvas.addEventListener('touchstart', (e) => {
  const touch = e.touches[0];
  const rect = canvas.getBoundingClientRect();
  const x = touch.clientX - rect.left;
  const y = touch.clientY - rect.top;

  // 가상 조이스틱 구현
});
```

## 🚀 성능 최적화

### 최적화 기법들

- **엔티티 풀링**: 자주 생성/삭제되는 객체 재사용
- **공간 분할**: 충돌 감지 최적화
- **렌더링 컬링**: 화면 밖 객체 렌더링 스킵
- **메시지 쓰로틀링**: 네트워크 트래픽 제한

### 성능 모니터링

```javascript
// 성능 통계 조회
const stats = game.getStats();
console.log('FPS:', stats.game.fps);
console.log('엔티티 수:', stats.game.entities);
console.log('메모리 사용량:', stats.system.memory);
```

## 🐛 문제 해결

### 일반적인 문제들

**Q: 게임이 로드되지 않습니다**

- A: 로컬 서버를 실행했는지 확인하세요. `file://` 프로토콜로는 ES6 모듈이 작동하지 않습니다.

**Q: 멀티플레이어가 작동하지 않습니다**

- A: 같은 브라우저, 같은 도메인에서만 BroadcastChannel이 작동합니다.

**Q: 테스트가 실패합니다**

- A: 브라우저 콘솔에서 자세한 오류 메시지를 확인하세요.

**Q: 성능이 느립니다**

- A: 디버그 모드를 비활성화하고, 엔티티 수를 확인하세요.

### 디버깅 도구

```javascript
// 콘솔에서 실행 가능한 디버깅 명령어
game.enableDebug(); // 디버그 모드 활성화
game.getStats(); // 전체 통계 조회
gameState.players.size; // 플레이어 수 확인
gameState.monsters.length; // 몬스터 수 확인
testFramework.runAllTests(); // 모든 테스트 실행
```

## 🤝 기여하기

### 개발 환경 설정

1. 저장소 클론
2. 로컬 서버 실행
3. 브라우저에서 테스트

### 코딩 스타일

- ES6+ 문법 사용
- JSDoc 주석 필수
- 테스트 코드 작성
- MVC 패턴 준수

### 풀 리퀘스트 가이드라인

1. 새 기능은 테스트와 함께 제출
2. 기존 테스트가 통과하는지 확인
3. 코드 스타일 가이드 준수
4. 문서 업데이트

## 📄 라이선스

MIT License - 자유롭게 사용, 수정, 배포 가능합니다.

## 🙏 감사의 말

이 프로젝트는 교육 목적으로 제작되었으며, MVC 패턴과 테스트 주도 개발의 좋은 예시가 되기를 바랍니다.

---

**즐거운 게임 되세요! 🎮✨**
