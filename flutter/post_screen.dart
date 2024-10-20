import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // 날짜 포맷을 위해 intl 패키지를 사용

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 현재 날짜를 yyyy년 M월 d일 형식으로 변환
    String currentDate = DateFormat('yyyy년 M월 d일').format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: Text('채팅 화면'), // 제목 설정
        backgroundColor: Color(0xFFC7B1D9), // 상단바 배경색
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // 뒤로 가기 아이콘
          onPressed: () {
            Navigator.pop(context); // 이전 화면으로 돌아가기
          },
        ),
      ),
      backgroundColor: Color(0xFFC7B1D9), // 배경색 설정 (연한 보라색 톤)
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30), // 상단 간격 추가
            // 날짜 표시
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                color: Color(0xFFEAEAEA),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                '$currentDate',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 30),
            // Naver 카드
            buildChatBubble(
              imagePath: 'assets/img/naver_logo.png', // 이미지 경로
              platform: 'Naver',
              content:
                  '“셀럽커플, 눈맞춤”…아이유, 스윗한 출국\n아이유가 해외 일정을 위해 26일 오전 인천국제공항을 통해 인도네시아 자카르타로 출국함.',
              likeCount: 20,
            ),
            SizedBox(height: 16),
            // YouTube 카드
            buildChatBubbleWithImage(
              logoPath: 'assets/img/youtube.png', // 왼쪽 로고 이미지 경로
              thumbnailPath: 'assets/img/IU_youtube.png', // 썸네일 이미지 경로
              platform: 'Youtube',
              videoTitle: '커플의 달달한 눈맞춤♥',
              likeCount: 20,
            ),
          ],
        ),
      ),
    );
  }

  // Naver 카드 만들기
  Widget buildChatBubble({
    required String imagePath,
    required String platform,
    required String content,
    required int likeCount,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: Colors.white, // 하얀 원
          radius: 16, // 원의 크기
          child: Image.asset(imagePath, width: 24, height: 24), // 이미지 크기
        ),
        SizedBox(width: 8),
        Expanded(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        platform,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    content,
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '$likeCount ♥',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // YouTube 카드 만들기 (이미지 포함)
  Widget buildChatBubbleWithImage({
    required String logoPath, // 로고 이미지 경로
    required String thumbnailPath, // 썸네일 이미지 경로
    required String platform,
    required String videoTitle,
    required int likeCount,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: Colors.white, // 하얀 원
          radius: 16, // 원의 크기
          child: Image.asset(logoPath, width: 24, height: 24), // 로고 이미지
        ),
        SizedBox(width: 8),
        Expanded(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 썸네일 이미지
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  child: Image.asset(thumbnailPath,
                      width: double.infinity, height: 180, fit: BoxFit.cover),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            platform,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        videoTitle,
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '$likeCount ♥',
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
