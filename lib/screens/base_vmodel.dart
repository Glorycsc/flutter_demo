import 'package:flutter/material.dart';

abstract class Presenter{
  //处理点击事件
  void onClick (String action);
}

abstract class ItemPresenter<T>{
  //处理列表点击事件
  void onItemClick(String action ,T item);

}

abstract class BaseVModel with ChangeNotifier{

  ApiService apiService = ApiService();

  bool _disposed = false;

  ViewState _viewState = ViewState.loading;

}
