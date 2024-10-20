import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Like List',
      theme: ThemeData(
        primaryColor: Color(0xFFE4E724), // 전체 테마 기본 색상 적용
      ),
      home: MyLikeListPage(),
    );
  }
}

class MyLikeListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('my page'),
        backgroundColor: Color(0xFFE4E724), // 상단바 배경색
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // 이전 화면으로 돌아가기
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildProfileSection(),
              SizedBox(height: 20),
              _buildLikeList(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/img/IU.png'), // 실제 이미지로 교체
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '유애나 님',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '진짜 TMI다.\nToo Much I love you.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFE4E724), // 버튼 색상 변경
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text('프로필 편집'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLikeList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(
            'My Like List',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black, // 제목 색상 변경
            ),
          ),
        ),
        SizedBox(height: 16),
        _buildLikeItem(Icons.video_library, '유튜브 영상 제목'),
        _buildLikeItem(Icons.article, '네이버 기사 제목'),
        _buildLikeItem(Icons.photo, '인스타그램 게시글 텍스트'),
        _buildLikeItem(Icons.chat, '트위터 게시글 텍스트'),
      ],
    );
  }

  Widget _buildLikeItem(IconData icon, String title) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Color(0xFFE4E724), // 테두리 색상
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: Color(0xFFE4E724), size: 30), // 아이콘 색상
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 20),
      ),
    );
  }
}
