# 내 자산 장부

휴대폰에서 쓰는 개인 자산·지출 장부입니다. 정적 사이트(GitHub Pages)이고, 데이터는 Supabase에 저장되며 로그인한 본인만 읽고 쓸 수 있습니다(Row Level Security).

## 처음 설정
1. Supabase 프로젝트를 만들고 SQL Editor에서 `supabase-setup.sql`을 실행합니다.
2. `config.js`에 Project URL과 anon(publishable) 키를 넣습니다. service_role / secret 키는 절대 넣지 않습니다.
3. Supabase > Authentication > URL Configuration의 Site URL을 이 사이트 주소로 바꿉니다(가입 확인 메일 링크용).
4. 사이트에서 계정을 만든 뒤, Authentication > Sign In / Providers에서 **Allow new users to sign up**을 끄면 다른 사람은 가입할 수 없습니다.

## 파일
- `index.html` 앱 전체 (화면, 계산, 저장)
- `config.js` Supabase 연결 정보
- `vendor/supabase.js` supabase-js 2.45.4 UMD 빌드
