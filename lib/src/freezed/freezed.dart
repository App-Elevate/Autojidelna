// This file is "main.dart"
// ignore_for_file: unused_import

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

// required: associates our `freezed.dart` with the code generated by Freezed
part 'freezed.freezed.dart';
// optional: Since our Github class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'freezed.g.dart';

@freezed
class GithubRelease with _$GithubRelease {
  const factory GithubRelease({
    @JsonKey(name: 'url') required String url,
    @JsonKey(name: 'assets_url') required String assetsUrl,
    @JsonKey(name: 'upload_url') required String uploadUrl,
    @JsonKey(name: 'html_url') required String htmlUrl,
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'assets') required List<GithubAsset> assets,
    @JsonKey(name: 'author') required GithubAuthor author,
    @JsonKey(name: 'node_id') required String nodeId,
    @JsonKey(name: 'tag_name') required String tagName,
    @JsonKey(name: 'target_commitish') required String targetCommitish,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'draft') required bool draft,
    @JsonKey(name: 'prerelease') required bool prerelease,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'published_at') required DateTime publishedAt,
    @JsonKey(name: 'tarball_url') required String tarballUrl,
    @JsonKey(name: 'zipball_url') required String zipballUrl,
    @JsonKey(name: 'body') required String body,
  }) = _GithubRelease;

  factory GithubRelease.fromJson(Map<String, Object?> json) => _$GithubReleaseFromJson(json);
}

@freezed
class GithubAuthor with _$GithubAuthor {
  const factory GithubAuthor({
    @JsonKey(name: 'login') required String login,
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'node_id') required String nodeId,
    @JsonKey(name: 'avatar_url') required String avatarUrl,
    @JsonKey(name: 'gravatar_id') required String gravatarId,
    @JsonKey(name: 'url') required String url,
    @JsonKey(name: 'html_url') required String htmlUrl,
    @JsonKey(name: 'followers_url') required String followersUrl,
    @JsonKey(name: 'following_url') required String followingUrl,
    @JsonKey(name: 'gists_url') required String gistsUrl,
    @JsonKey(name: 'starred_url') required String starredUrl,
    @JsonKey(name: 'subscriptions_url') required String subscriptionsUrl,
    @JsonKey(name: 'organizations_url') required String organizationsUrl,
    @JsonKey(name: 'repos_url') required String reposUrl,
    @JsonKey(name: 'events_url') required String eventsUrl,
    @JsonKey(name: 'received_events_url') required String receivedEventsUrl,
    @JsonKey(name: 'type') required String type,
    @JsonKey(name: 'site_admin') required bool siteAdmin,
  }) = _GithubAuthor;

  factory GithubAuthor.fromJson(Map<String, Object?> json) => _$GithubAuthorFromJson(json);
}

@freezed
class GithubAsset with _$GithubAsset {
  const factory GithubAsset({
    @JsonKey(name: 'url') required String url,
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'node_id') required String nodeId,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'label') String? label,
    @JsonKey(name: 'uploader') required GithubUploader uploader,
    @JsonKey(name: 'content_type') required String contentType,
    @JsonKey(name: 'state') required String state,
    @JsonKey(name: 'size') required int size,
    @JsonKey(name: 'download_count') required int downloadCount,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'browser_download_url') required String browserDownloadUrl,
  }) = _GithubAsset;

  factory GithubAsset.fromJson(Map<String, Object?> json) => _$GithubAssetFromJson(json);
}

@freezed
class GithubUploader with _$GithubUploader {
  const factory GithubUploader({
    @JsonKey(name: 'login') required String login,
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'node_id') required String nodeId,
    @JsonKey(name: 'avatar_url') required String avatarUrl,
    @JsonKey(name: 'gravatar_id') required String gravatarId,
    @JsonKey(name: 'url') required String url,
    @JsonKey(name: 'html_url') required String htmlUrl,
    @JsonKey(name: 'followers_url') required String followersUrl,
    @JsonKey(name: 'following_url') required String followingUrl,
    @JsonKey(name: 'gists_url') required String gistsUrl,
    @JsonKey(name: 'starred_url') required String starredUrl,
    @JsonKey(name: 'subscriptions_url') required String subscriptionsUrl,
    @JsonKey(name: 'organizations_url') required String organizationsUrl,
    @JsonKey(name: 'repos_url') required String reposUrl,
    @JsonKey(name: 'events_url') required String eventsUrl,
    @JsonKey(name: 'received_events_url') required String receivedEventsUrl,
    @JsonKey(name: 'type') required String type,
    @JsonKey(name: 'site_admin') required bool siteAdmin,
  }) = _GithubUploader;

  factory GithubUploader.fromJson(Map<String, Object?> json) => _$GithubUploaderFromJson(json);
}