// Supabase 프로젝트의 Project URL과 anon(publishable) 키를 넣으세요.
// 이 두 값은 브라우저에 공개되도록 만들어진 값이라 저장소에 올라가도 괜찮습니다.
// 데이터는 Supabase의 Row Level Security로 로그인한 본인만 읽고 쓸 수 있습니다.
// service_role / secret 키는 절대 여기에 넣지 마세요.
window.LEDGER_CONFIG = {
  supabaseUrl: "https://mtctwzntaqssjdjdgdsn.supabase.co",
  supabaseAnonKey: "sb_publishable_WGhFX5zudp63ef9eU4OFfQ_8wgwKGWl",
  // 구글 드라이브 백업용 OAuth 클라이언트 ID (…apps.googleusercontent.com). 공개되어도 괜찮은 값입니다.
  googleClientId: "1061218994502-oivq39d9mkmeq34b8bde4phh3450itb1.apps.googleusercontent.com",
};
