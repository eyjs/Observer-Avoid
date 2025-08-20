@echo off
REM GitHub Pages 배포 스크립트 (Windows)
REM main의 최신 내용으로 gh-pages를 완전히 덮어씌움

REM main 브랜치로 전환 및 최신화
echo Switching to main branch...
git checkout main

REM 변경사항 자동 커밋
echo Committing local changes on main...
git add .
git commit -m "Auto-deploy commit" || echo No changes to commit

REM main 브랜치 푸시
echo Pushing changes to origin/main...
git push origin main

REM gh-pages 브랜치로 전환
echo Switching to gh-pages branch...
git checkout gh-pages

REM main 브랜치 내용으로 강제 덮어쓰기
echo Resetting gh-pages to match main...
git reset --hard main

REM gh-pages 브랜치 강제 푸시 (이력 덮어쓰기)
echo Pushing updates to gh-pages...
git push origin gh-pages --force

REM 다시 main으로 돌아가기
git checkout main

echo Deployment to GitHub Pages complete! gh-pages now matches main.
pause