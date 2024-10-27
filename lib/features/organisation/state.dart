// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:inertia/models/models.dart';

class OrganisationState {
  List<Organisation> organisations;

  OrganisationState({
    this.organisations = const [],
  });

  OrganisationState copyWith({
    List<Organisation>? organisations,
  }) {
    return OrganisationState(
      organisations: organisations ?? this.organisations,
    );
  }
}
