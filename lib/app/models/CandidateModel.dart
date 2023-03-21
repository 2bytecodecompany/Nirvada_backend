class CandidateModel {
  late String candidateId;
  late String electionId;
  late String candidateName;
  late String candidatePartyName;
  late String candidatePartySign;
  late String candidateImage;
  late int candidateVoteCount;
  late String booth;

  CandidateModel({
    required this.candidateId,
    required this.electionId,
    required this.candidateName,
    required this.candidatePartyName,
    required this.candidatePartySign,
    required this.candidateVoteCount,
    required this.candidateImage,
    required this.booth,
  });

  CandidateModel.fromJson(Map<String, dynamic> json) {
    candidateId = json['candidate_id'];
    electionId = json['election_id'];
    candidateName = json['candidate_name'];
    candidatePartyName = json['candidate_party_name'];
    candidatePartySign = json['candidate_party_sign'];
    candidateVoteCount = json['candidate_vote_count'];
    candidateImage = json['candidate_image'];
    booth = json['booth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['candidate_id'] = this.candidateId;
    data['election_id'] = this.electionId;
    data['candidate_name'] = this.candidateName;
    data['candidate_party_name'] = this.candidatePartyName;
    data['candidate_party_sign'] = this.candidatePartySign;
    data['candidate_vote_count'] = this.candidateVoteCount;
    data['candidate_image'] = this.candidateImage;
    data['booth'] = this.booth;
    return data;
  }
}
