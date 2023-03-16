void afterSeconds(int seconds, Function action) =>
    Future.delayed(Duration(seconds: seconds), () => action.call());
