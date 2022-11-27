class PostAddCampaignRequest {
  String? userId;
  String? addedCampaignId;

  PostAddCampaignRequest(this.userId, this.addedCampaignId);

  PostAddCampaignRequest.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    addedCampaignId = json['added_campaign_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['added_campaign_id'] = this.addedCampaignId;
    return data;
  }
}
