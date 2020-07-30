import 'package:flutterintexspa/pages/me/LoginPage.dart';
import 'package:flutterintexspa/pages/home/HomePage.dart';
import 'package:flutterintexspa/route/page_builder.dart';
import 'package:flutterintexspa/route/bundle.dart';


class RouteConstant {
  static final INDEX_PAGE = "index_page";
  static final TEST_PAGE = "test_page"; //测试页面
  static final MESSAGEP_PAGE = "messagep_page"; //测试页面

  static final HOME_PAGE = "home_page";
  static final LOGIN_PAGE = "login_page";
  static final SELECT_CUSTOMER_PAGE = "select_customer_page";
  static final NEW_SERVICE_PAGE = 'new_service_page';
  static final RESET_PWD_PAGE = 'reset_pwd_page';
  static final JOB_SETTLE_PAGE = 'job_settle_page';
  static final ORDER_DETAIL_PAGE = 'order_detail_page';
  static final DISPATCH_PAGE = 'dispatch_page';
  static final PAYMENT_METHOD_PAGE = 'payment_method_page';
  static final PICK_CAR_ORDER_PAGE = 'pick_car_order_page'; //接车开单页面
  static final TEMP_CUSTOMER_ORDER = 'TEMP_CUSTOMER_ORDER'; // 临时客户下单
  static final ADD_SERVICE_PAGE = 'add_service_page'; //添加服务
  static final ADD_USER_PAGE = 'add_user_page';
  static final MINE_BASE_PAGE = 'mine_base_page';//个人中心-基本信息
  static final ORDER_WORK_MANAGEMENT = 'order_work_management'; //工单管理
  static final MINE_STORE_CODE_PAGE = 'mine_store_code_page'; //个人中心-门店二维码
  static final REMIND_MAIN_PAGE = "remind_main_page"; // 智能提醒主页
  static final REMIND_SETTINGS_PAGE = "remind_settings_page"; // 智能提醒设置
  static final REMIND_DETAIL_PAGE = "remind_detail_page"; // 智能提醒详情
  static final REMIND_LICENSE_LIMITED_PAGE = "remind_license_limited_page"; // 智能提醒行驶证到期
  static final REMIND_RETURN_CUSTOMER_PAGE = "remind_return_customer_page"; // 智能提醒回访客户
  static final REMIND_INSURANCE_PAGE = "remind_insurance_page"; // 智能提醒保险
  static final CUSTOMER_DETAIL_PAGE = 'customer_detail_page'; //客户资料
  static final SELECT_EMPLOYEES_PAGE = 'select_employees_page'; //员工列表
  static final EMPLOYES_INFO_PAGE = 'employes_info_page'; //员工信息



}

final Map<String, PageBuilder> pageRoutes = {
//  RouteConstant.INDEX_PAGE: PageBuilder(builder: (bundle) => IndexPage()),
//  RouteConstant.TEST_PAGE: PageBuilder(builder: (bundle) => TestPage()),
//  RouteConstant.MESSAGEP_PAGE: PageBuilder(builder: (bundle) => MessagePage(bundle:bundle)),
  RouteConstant.HOME_PAGE: PageBuilder(builder: (bundle) => HomePage(bundle:bundle)),
  RouteConstant.LOGIN_PAGE: PageBuilder(builder: (bundle) => LoginPage(bundle:bundle)),
//  RouteConstant.SELECT_CUSTOMER_PAGE: PageBuilder(builder: (bundle) => SelectCustomerPage(bundle: bundle)),
//  RouteConstant.NEW_SERVICE_PAGE:PageBuilder(builder: (bundle) => NewServicePage(bundle: bundle)),
//  RouteConstant.RESET_PWD_PAGE:PageBuilder(builder: (bundle) => ResetPwdPage()),
//  RouteConstant.JOB_SETTLE_PAGE:PageBuilder(builder: (bundle) => JobSettlePage(bundle: bundle)),
//  RouteConstant.ORDER_DETAIL_PAGE:PageBuilder(builder: (bundle) => OrderDetailPage(bundle: bundle)),
//  RouteConstant.DISPATCH_PAGE:PageBuilder(builder: (bundle) => DispatchPage(bundle: bundle)),
//  RouteConstant.PAYMENT_METHOD_PAGE:PageBuilder(builder: (bundle) => PayMentMethodPage(bundle: bundle)),
//  RouteConstant.PAYMENT_METHOD_PAGE:PageBuilder(builder: (bundle) => PayMentMethodPage(bundle: bundle)),
//  RouteConstant.PICK_CAR_ORDER_PAGE:PageBuilder(builder: (bundle) => PickCarOrderPage(bundle: bundle)),
//  RouteConstant.TEMP_CUSTOMER_ORDER:PageBuilder(builder: (bundle) => TempCustOmerOrder()),
//  RouteConstant.ADD_SERVICE_PAGE:PageBuilder(builder: (bundle) => AddServicePage(bundle: bundle)),
//  RouteConstant.ADD_USER_PAGE:PageBuilder(builder: (bundle) => AddUserPage(bundle: bundle)),
//  RouteConstant.MINE_BASE_PAGE:PageBuilder(builder: (bundle) => MineBasePage(bundle: bundle)),//个人中心-基本信息
//  RouteConstant.ORDER_WORK_MANAGEMENT:PageBuilder(builder: (bundle) => OrderWorkManagement()), //工单管理页面
//  RouteConstant.MINE_STORE_CODE_PAGE:PageBuilder(builder: (bundle) => MineStoreCode(bundle: bundle)), //个人中心-门店二维码
//  RouteConstant.REMIND_MAIN_PAGE:PageBuilder(builder: (bundle) => RemindMainPage()), //智能提醒主页
//  RouteConstant.REMIND_SETTINGS_PAGE:PageBuilder(builder: (bundle) => RemindSettingsPage()), //智能提醒设置
//  RouteConstant.REMIND_DETAIL_PAGE:PageBuilder(builder: (bundle) => RemindDetailPage()), //智能提醒详情
//  RouteConstant.REMIND_LICENSE_LIMITED_PAGE:PageBuilder(builder: (bundle) => LicenseLimitedPage(bundle: bundle)), //智能提醒详情
//  RouteConstant.REMIND_RETURN_CUSTOMER_PAGE:PageBuilder(builder: (bundle) => RemindReturnCustomerPage()), //智能提醒详情
//  RouteConstant.REMIND_INSURANCE_PAGE:PageBuilder(builder: (bundle) => RemindInsurancePage()), //智能提醒详情
//  RouteConstant.CUSTOMER_DETAIL_PAGE:PageBuilder(builder: (bundle) => CustomerDetailPage(bundle: bundle)), // 客户资料
//  RouteConstant.SELECT_EMPLOYEES_PAGE:PageBuilder(builder: (bundle) => SelectEmployeesPage()), // 选择客户
//  RouteConstant.EMPLOYES_INFO_PAGE:PageBuilder(builder: (bundle) => EmployesInfoPage(bundle: bundle)), // 员工信息
};
