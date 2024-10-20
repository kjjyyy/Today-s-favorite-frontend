import 'package:flutter/material.dart';
import 'main_screen.dart'; // main_screen.dart 파일 임포트

// 회원가입 페이지
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key); // const 생성자 추가

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _passwordController = TextEditingController();
  String? _passwordError;
  bool _termsAccepted = false;
  bool _privacyAccepted = false;
  bool _marketingAccepted = false;

  void _validatePassword(String value) {
    // 비밀번호 유효성 검사 로직
    if (value.length < 6 ||
        !RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9])').hasMatch(value)) {
      setState(() {
        _passwordError = '비밀번호는 영문과 숫자를 포함한 6자리 이상이어야 합니다.';
      });
    } else {
      setState(() {
        _passwordError = null; // 비밀번호가 유효하면 오류 메시지 제거
      });
    }
  }

  @override
  void dispose() {
    _passwordController.dispose(); // TextEditingController 해제
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원가입'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // 로그인 페이지로 이동
            Navigator.pop(context); // 뒤로가기
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField('아이디', '아이디 입력'),
            Divider(height: 20, thickness: 1, color: Colors.grey[300]),
            _buildTextField(
              '비밀번호',
              '영문+숫자 6자리 이상 비밀번호 입력',
              isPassword: true,
              controller: _passwordController,
              onChanged: _validatePassword,
              errorText: _passwordError,
            ),
            Divider(height: 20, thickness: 1, color: Colors.grey[300]),
            _buildTextField('닉네임', '닉네임 입력'),
            Divider(height: 20, thickness: 1, color: Colors.grey[300]),
            _buildTextField('최애설정', '최애이름 입력'),
            Divider(height: 20, thickness: 1, color: Colors.grey[300]),
            SizedBox(height: 20),
            _buildCheckBox('서비스 이용약관', _termsAccepted, (newValue) {
              setState(() {
                _termsAccepted = newValue!;
              });
            }),
            _buildCheckBox('개인정보 처리방침', _privacyAccepted, (newValue) {
              setState(() {
                _privacyAccepted = newValue!;
              });
            }),
            Row(
              children: [
                _buildCheckBox('마케팅 정보 수신동의', _marketingAccepted, (newValue) {
                  setState(() {
                    _marketingAccepted = newValue!;
                  });
                }),
                Spacer(),
                TextButton(
                  onPressed: () {
                    // 약관 전문 보기 클릭 시 처리할 로직
                  },
                  child: Text('약관 전문 보기', style: TextStyle(color: Colors.grey)),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // 가입완료 버튼 클릭 시 메인 페이지로 이동
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
              child: Text('가입완료'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50), // 버튼을 화면 너비에 맞추기
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint,
      {bool isPassword = false,
      TextEditingController? controller,
      Function(String)? onChanged,
      String? errorText}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: isPassword,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0), // 둥근 모서리 설정
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            errorText: errorText, // 오류 메시지를 설정
            errorStyle: TextStyle(color: Colors.red), // 오류 메시지 색상 설정
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildCheckBox(String title, bool value, Function(bool?) onChanged) {
    return Row(
      children: [
        Theme(
          data: ThemeData(
            unselectedWidgetColor: Colors.grey, // 체크박스 색상 변경 (선택 안 됐을 때)
          ),
          child: Checkbox(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5), // 체크박스도 둥근 모서리로
            ),
            value: value,
            onChanged: onChanged,
          ),
        ),
        Text(title),
      ],
    );
  }
}
