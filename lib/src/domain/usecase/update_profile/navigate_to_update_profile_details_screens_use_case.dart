import 'package:talent_link/src/presentation/blocs/update_profile/update_profile_bloc.dart';

class NavigateToUpdateProfileDetailsScreensUseCase {
  UpdateProfileState call({
    required UpdateProfileState requestState,
    required int id,
  }) {
    if (id == 6171) {
      requestState = NavigateToAddressScreenState();
    } else if (id == 6180) {
      requestState = NavigateToContactScreenState();
    } else if (id == 6173) {
      requestState = NavigateToAttachmentScreenState();
    } else if (id == 6174) {
      requestState = NavigateToAssetScreenState();
    } else if (id == 6181) {
      requestState = NavigateToEducationScreenState();
    }

    return requestState;
  }
}
