import 'package:flutter/material.dart';

//加载进度条组件
class LoadingContainer extends StatelessWidget {
  final Widget child; //代表内容
  final bool isLoading; //是否显示进度
  final bool cover; //是否覆盖child

  const LoadingContainer(
      {Key key,
      @required this.isLoading,
      this.cover = false,
      @required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !cover?!isLoading?child:_loadingView:Stack(
      children: <Widget>[child,isLoading?_loadingView:null],
    );
  }
  Widget get _loadingView{
    return Center(
      child: CircularProgressIndicator(//圆形进度条

      ),
    );
  }
}
