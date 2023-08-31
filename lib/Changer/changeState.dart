abstract class ChangeState{}

class InitColor extends ChangeState{}
class SetColorGain extends ChangeState{}
class SetColorMain extends ChangeState{}
class SetColorLose extends ChangeState{}
class ChangeRadioState extends ChangeState{}


abstract class ChangeCartState{}

class InitCart extends ChangeCartState{}
class SetString extends ChangeCartState{}
class SetList extends ChangeCartState{}
class DeleteFromList extends ChangeCartState{}
class UpdateCount extends ChangeCartState{}
class ClearList extends ChangeCartState{}
class UpdateCurrencyx extends ChangeCartState{}



abstract class ChangeLaunchState{}

class InitLaunch extends ChangeLaunchState{}
class SetLaunch extends ChangeLaunchState{}