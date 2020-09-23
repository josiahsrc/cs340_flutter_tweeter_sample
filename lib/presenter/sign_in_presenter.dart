abstract class SignInView {
  void setIsLoading(bool value);
  void navigateToMainPage();
  void displayErrorMessage(String message);
}

class SignInPresenter {
  SignInPresenter({
    this.view,
  });

  final SignInView view;

  Future<void> onLogIn() async {
    view.setIsLoading(true);

    try {
      await Future.delayed(Duration(seconds: 1));
      view.setIsLoading(false);
      view.navigateToMainPage();
    } on Error catch (e) {
      view.setIsLoading(false);
      view.displayErrorMessage(e.toString());
    }
  }
}
