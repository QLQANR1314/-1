import 'package:biyan_finance/apis/loginapi.dart';
import 'package:biyan_finance/common/toast_utils.dart';
import 'package:biyan_finance/widgets/navigation.dart';
import 'package:flutter/material.dart';

class LoginRegistProvider extends ChangeNotifier {
  String email = "";
  String code = "";
  String password = "";

  String keystr = "";



  String invitationCode = "";

  bool isSendingEmail = false;


   

  setEmail(String v) {
    email = v;
    notifyListeners();
  }

   setEmailcode(String v) {
    code = v;
    notifyListeners();
  }

  setPassword(String v) {
    password = v;
    notifyListeners();
  }

  setinvitationCode(String v) {
    invitationCode = v;
    notifyListeners();
  }

  setIsSendingEmail(bool v) {
    isSendingEmail = v;
    notifyListeners();
  }

  sendemailNext(BuildContext context) async {
    print("object---${email}");
    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegExp.hasMatch(email)) {
      ToastUtils.showError("邮箱填写错误");
      return;
    }

    setIsSendingEmail(true);

    Loginapi.regist(email: email).then((value) {

      print("object===${value.data!["key"]}");
      keystr = value.data!["key"];
    });


    // setIsSendingEmail(false);
  }


  login(BuildContext context) async {
  

    try {
      final res = await Loginapi.registLogin(
        email: email,
        code: code,
        password:password,
        keyStr:keystr

      );
     
      if (res.code != 1) {
        ToastUtils.showError(res.msg ?? "Login failed");
        return;
      }

     
      if (!context.mounted) return;
      // EnjoyManager.loginInit(context);
      Navigation.popUntil(context, count: 1);
    } catch (e) {
     
      rethrow;
    }
  }

  // reset() {
  //   email = "";
  //   code = "";
  //   isSendingEmail = false;
  //   isSubmitting = false;
  // }
}

// sendCode(BuildContext context) async {
//     final RegExp emailRegExp = RegExp(
//       r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
//     );
//     if (!emailRegExp.hasMatch(email)) {
//       ToastUtils.showError(context.tr("emailValidFail"));
//       return;
//     }
//     setIsSendingEmail(true);
//     final res = await UserApi.sendCode(email);
//     setIsSendingEmail(false);

//     if (res.code != 200) {
//       ToastUtils.showError(res.msg ?? "Send code failed");
//       return;
//     }

//     if (!context.mounted) return;
//     ToastUtils.showSuccess(context.tr("codeSendSuccessMsg"));
//     Navigation.push(
//       context: context,
//       child: const LoginCode(),
//     );
//   }


// import 'package:biyan_finance/common/toast_utils.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// class LoginProvider extends ChangeNotifier {
//   String email = "";
//   String phone = "";
//   String password = "";

//   bool isSendingEmail = false;

//   bool isSendingPhone = false;

  // setEmail(String v) {
  //   email = v;
  //   notifyListeners();
  // }

//   setPhone(String v) {
//     phone = v;
//     notifyListeners();
//   }

  // setPassword(String v) {
  //   password = v;
  //   notifyListeners();
  // }

  // setIsSendingEmail(bool v) {
  //   isSendingEmail = v;
  //   notifyListeners();
  // }

//   setIsSendingPhone(bool v) {
//     isSendingPhone = v;
//     notifyListeners();
//   }

//   setclean(BuildContext context) {
//     isSendingEmail = false;
//     isSendingPhone = false;


//   }

  // sendNext(BuildContext context) async {
  //   print("object---${email}");
  //   final RegExp emailRegExp = RegExp(
  //     r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  //   );
  //   if (!emailRegExp.hasMatch(email)) {
  //     ToastUtils.showError("邮箱填写错误");
  //     return;
  //   }

  //   setIsSendingEmail(true);
  // }

//   sendphoneNext(BuildContext context) async {
//     print("object---${phone}");
//     final RegExp phoneRegExp = RegExp(
//       r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$',
//     );

//     if (!phoneRegExp.hasMatch(phone)) {
//       ToastUtils.showError("手机号填写错误");
//       return;
//     }

//     setIsSendingPhone(true);
//   }
// }
