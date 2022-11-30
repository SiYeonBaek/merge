package util;

public class MyCommon {

	// Index Path
	public static final String MAIN_VIEW_PATH = "/WEB-INF/views/";
	
	// User Folder Path
	public static final String USER_VIEW_PATH = "/WEB-INF/views/user/";
	
	// Admin Path
	public static final String ADMIN_VIEW_PATH = "/WEB-INF/views/admin/";
	
	//일반게시판용
		public static class Board{
			//한페이지에 보여줄 게시물 개수
			public final static int BLOCKLIST = 10; //Common.Board.BLOCKLIST -> 10;
			
			//페이지 메뉴 수
			//<- 1 2 3 ->
			public final static int BLOCKPAGE = 4;
		}
		
		//공지사항 게시판용
		public static class Notice{
			
			public final static int BLOCKLIST = 20; //Common.Notice.BLOCKLIST -> 20;
			public final static int BLOCKPAGE = 5;
		}
	
}
