// https://stackoverflow.com/a/34032216

function Controller() {
  installer.autoRejectMessageBoxes();
  installer.installationFinished.connect(function() {
    gui.clickButton(buttons.NextButton);
  })
}

Controller.prototype.WelcomePageCallback = function() {
  // click delay here because the next button is initially disabled for ~1 second
  gui.clickButton(buttons.NextButton, 3000);
}

Controller.prototype.CredentialsPageCallback = function() {
  gui.clickButton(buttons.NextButton);
}

Controller.prototype.IntroductionPageCallback = function() {
  gui.clickButton(buttons.NextButton);
}

Controller.prototype.TargetDirectoryPageCallback = function()
{
  gui.currentPageWidget().TargetDirectoryLineEdit.setText("/opt/Qt5.5.1/");
  gui.clickButton(buttons.NextButton);
}

Controller.prototype.ComponentSelectionPageCallback = function() {
  var widget = gui.currentPageWidget();

  widget.deselectAll();
  widget.selectComponent("qt.55.gcc_64");
  widget.selectComponent("qt.55.qtquickcontrols");

  widget.deselectComponent("qt.tools.qtcreator");
  widget.deselectComponent("qt.55.qt3d");
  widget.deselectComponent("qt.55.qtcanvas3d");
  widget.deselectComponent("qt.55.qtlocation");
  widget.deselectComponent("qt.55.qtquick1");
  widget.deselectComponent("qt.55.qtscript");
  widget.deselectComponent("qt.55.qtwebengine");
  widget.deselectComponent("qt.extras");
  widget.deselectComponent("qt.tools.doc");
  widget.deselectComponent("qt.tools.examples");

  gui.clickButton(buttons.NextButton);
}

Controller.prototype.LicenseAgreementPageCallback = function() {
  gui.currentPageWidget().AcceptLicenseRadioButton.setChecked(true);
  gui.clickButton(buttons.NextButton);
}

Controller.prototype.StartMenuDirectoryPageCallback = function() {
  gui.clickButton(buttons.NextButton);
}

Controller.prototype.ReadyForInstallationPageCallback = function()
{
  gui.clickButton(buttons.NextButton);
}

Controller.prototype.FinishedPageCallback = function() {
  var checkBoxForm = gui.currentPageWidget().LaunchQtCreatorCheckBoxForm;
  if (checkBoxForm && checkBoxForm.launchQtCreatorCheckBox) {
    checkBoxForm.launchQtCreatorCheckBox.checked = false;
  }
  gui.clickButton(buttons.FinishButton);
}