/// userId : "a306e5d6-0ba8-4c6d-853e-d43370c18600"
/// userName : "glorizz"
/// emailAddress : "glorizz@sina.com"
/// phoneNumber : " 861881749667"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOiJhMzA2ZTVkNi0wYmE4LTRjNmQtODUzZS1kNDMzNzBjMTg2MDAiLCJVc2VyTmFtZSI6Imdsb3JpenoiLCJFbWFpbEFkcmVzcyI6Imdsb3JpenpAc2luYS5jb20iLCJQaG9uZU51bWJlciI6IiA4NjE4ODE3NDk2NjciLCJVc2VyUm9sZUlkIjoiMiIsIlVzZXJSb2xlIjoiQ29tbW9uVXNlciIsIm5iZiI6MTU5NTk5MjY3NiwiZXhwIjoxNTk2NDI0Njc2LCJpYXQiOjE1OTU5OTI2NzZ9.De1Tb3BBd4O9vMpc_h1uRYaavEKKjnRonA87xApP9jI"
/// refreshToken : "LFLh9Bvd/LT6fuynMBkmbAqzwmok8NOrd1H3vdzqdaRz0XYJlk9ynYQ4i74YrugI5LE7q8eMny7QxzhPn3M9eAPIZSamV7+P"

class BeanJsonTestBean {
  String userId;
  String userName;
  String emailAddress;
  String phoneNumber;
  String token;
  String refreshToken;

  static BeanJsonTestBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    BeanJsonTestBean beanJsonTestBeanBean = BeanJsonTestBean();
    beanJsonTestBeanBean.userId = map['userId'];
    beanJsonTestBeanBean.userName = map['userName'];
    beanJsonTestBeanBean.emailAddress = map['emailAddress'];
    beanJsonTestBeanBean.phoneNumber = map['phoneNumber'];
    beanJsonTestBeanBean.token = map['token'];
    beanJsonTestBeanBean.refreshToken = map['refreshToken'];
    return beanJsonTestBeanBean;
  }

  Map toJson() => {
    "userId": userId,
    "userName": userName,
    "emailAddress": emailAddress,
    "phoneNumber": phoneNumber,
    "token": token,
    "refreshToken": refreshToken,
  };
}