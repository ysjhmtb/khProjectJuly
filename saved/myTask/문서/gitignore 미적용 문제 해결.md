.gitignore 파일을 https://www.gitignore.io/ 를 통해 작성하고, 일부 수정한 후에 적용이 되지 않는 문제 발견.

<br>

[.gitignore 설정후에 정상적으로 적용되지 않는 문제 해결하기](http://theeye.pe.kr/archives/2091) 를 통해 문제 해결.

<br>

```bash
$ git rm -r --cached .
$ git add .
$ git commit -m "fixed untracked files”

```

<br>