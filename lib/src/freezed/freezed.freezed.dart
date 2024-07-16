// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GithubRelease _$GithubReleaseFromJson(Map<String, dynamic> json) {
  return _GithubRelease.fromJson(json);
}

/// @nodoc
mixin _$GithubRelease {
  @JsonKey(name: 'url')
  String get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'assets_url')
  String get assetsUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'upload_url')
  String get uploadUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'html_url')
  String get htmlUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'assets')
  List<GithubAsset> get assets => throw _privateConstructorUsedError;
  @JsonKey(name: 'author')
  GithubAuthor get author => throw _privateConstructorUsedError;
  @JsonKey(name: 'node_id')
  String get nodeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'tag_name')
  String get tagName => throw _privateConstructorUsedError;
  @JsonKey(name: 'target_commitish')
  String get targetCommitish => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'draft')
  bool get draft => throw _privateConstructorUsedError;
  @JsonKey(name: 'prerelease')
  bool get prerelease => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'published_at')
  DateTime get publishedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'tarball_url')
  String get tarballUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'zipball_url')
  String get zipballUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'body')
  String get body => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GithubReleaseCopyWith<GithubRelease> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GithubReleaseCopyWith<$Res> {
  factory $GithubReleaseCopyWith(
          GithubRelease value, $Res Function(GithubRelease) then) =
      _$GithubReleaseCopyWithImpl<$Res, GithubRelease>;
  @useResult
  $Res call(
      {@JsonKey(name: 'url') String url,
      @JsonKey(name: 'assets_url') String assetsUrl,
      @JsonKey(name: 'upload_url') String uploadUrl,
      @JsonKey(name: 'html_url') String htmlUrl,
      @JsonKey(name: 'id') int id,
      @JsonKey(name: 'assets') List<GithubAsset> assets,
      @JsonKey(name: 'author') GithubAuthor author,
      @JsonKey(name: 'node_id') String nodeId,
      @JsonKey(name: 'tag_name') String tagName,
      @JsonKey(name: 'target_commitish') String targetCommitish,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'draft') bool draft,
      @JsonKey(name: 'prerelease') bool prerelease,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'published_at') DateTime publishedAt,
      @JsonKey(name: 'tarball_url') String tarballUrl,
      @JsonKey(name: 'zipball_url') String zipballUrl,
      @JsonKey(name: 'body') String body});

  $GithubAuthorCopyWith<$Res> get author;
}

/// @nodoc
class _$GithubReleaseCopyWithImpl<$Res, $Val extends GithubRelease>
    implements $GithubReleaseCopyWith<$Res> {
  _$GithubReleaseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? assetsUrl = null,
    Object? uploadUrl = null,
    Object? htmlUrl = null,
    Object? id = null,
    Object? assets = null,
    Object? author = null,
    Object? nodeId = null,
    Object? tagName = null,
    Object? targetCommitish = null,
    Object? name = null,
    Object? draft = null,
    Object? prerelease = null,
    Object? createdAt = null,
    Object? publishedAt = null,
    Object? tarballUrl = null,
    Object? zipballUrl = null,
    Object? body = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      assetsUrl: null == assetsUrl
          ? _value.assetsUrl
          : assetsUrl // ignore: cast_nullable_to_non_nullable
              as String,
      uploadUrl: null == uploadUrl
          ? _value.uploadUrl
          : uploadUrl // ignore: cast_nullable_to_non_nullable
              as String,
      htmlUrl: null == htmlUrl
          ? _value.htmlUrl
          : htmlUrl // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      assets: null == assets
          ? _value.assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<GithubAsset>,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as GithubAuthor,
      nodeId: null == nodeId
          ? _value.nodeId
          : nodeId // ignore: cast_nullable_to_non_nullable
              as String,
      tagName: null == tagName
          ? _value.tagName
          : tagName // ignore: cast_nullable_to_non_nullable
              as String,
      targetCommitish: null == targetCommitish
          ? _value.targetCommitish
          : targetCommitish // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      draft: null == draft
          ? _value.draft
          : draft // ignore: cast_nullable_to_non_nullable
              as bool,
      prerelease: null == prerelease
          ? _value.prerelease
          : prerelease // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      publishedAt: null == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tarballUrl: null == tarballUrl
          ? _value.tarballUrl
          : tarballUrl // ignore: cast_nullable_to_non_nullable
              as String,
      zipballUrl: null == zipballUrl
          ? _value.zipballUrl
          : zipballUrl // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GithubAuthorCopyWith<$Res> get author {
    return $GithubAuthorCopyWith<$Res>(_value.author, (value) {
      return _then(_value.copyWith(author: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GithubReleaseImplCopyWith<$Res>
    implements $GithubReleaseCopyWith<$Res> {
  factory _$$GithubReleaseImplCopyWith(
          _$GithubReleaseImpl value, $Res Function(_$GithubReleaseImpl) then) =
      __$$GithubReleaseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'url') String url,
      @JsonKey(name: 'assets_url') String assetsUrl,
      @JsonKey(name: 'upload_url') String uploadUrl,
      @JsonKey(name: 'html_url') String htmlUrl,
      @JsonKey(name: 'id') int id,
      @JsonKey(name: 'assets') List<GithubAsset> assets,
      @JsonKey(name: 'author') GithubAuthor author,
      @JsonKey(name: 'node_id') String nodeId,
      @JsonKey(name: 'tag_name') String tagName,
      @JsonKey(name: 'target_commitish') String targetCommitish,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'draft') bool draft,
      @JsonKey(name: 'prerelease') bool prerelease,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'published_at') DateTime publishedAt,
      @JsonKey(name: 'tarball_url') String tarballUrl,
      @JsonKey(name: 'zipball_url') String zipballUrl,
      @JsonKey(name: 'body') String body});

  @override
  $GithubAuthorCopyWith<$Res> get author;
}

/// @nodoc
class __$$GithubReleaseImplCopyWithImpl<$Res>
    extends _$GithubReleaseCopyWithImpl<$Res, _$GithubReleaseImpl>
    implements _$$GithubReleaseImplCopyWith<$Res> {
  __$$GithubReleaseImplCopyWithImpl(
      _$GithubReleaseImpl _value, $Res Function(_$GithubReleaseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? assetsUrl = null,
    Object? uploadUrl = null,
    Object? htmlUrl = null,
    Object? id = null,
    Object? assets = null,
    Object? author = null,
    Object? nodeId = null,
    Object? tagName = null,
    Object? targetCommitish = null,
    Object? name = null,
    Object? draft = null,
    Object? prerelease = null,
    Object? createdAt = null,
    Object? publishedAt = null,
    Object? tarballUrl = null,
    Object? zipballUrl = null,
    Object? body = null,
  }) {
    return _then(_$GithubReleaseImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      assetsUrl: null == assetsUrl
          ? _value.assetsUrl
          : assetsUrl // ignore: cast_nullable_to_non_nullable
              as String,
      uploadUrl: null == uploadUrl
          ? _value.uploadUrl
          : uploadUrl // ignore: cast_nullable_to_non_nullable
              as String,
      htmlUrl: null == htmlUrl
          ? _value.htmlUrl
          : htmlUrl // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      assets: null == assets
          ? _value._assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<GithubAsset>,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as GithubAuthor,
      nodeId: null == nodeId
          ? _value.nodeId
          : nodeId // ignore: cast_nullable_to_non_nullable
              as String,
      tagName: null == tagName
          ? _value.tagName
          : tagName // ignore: cast_nullable_to_non_nullable
              as String,
      targetCommitish: null == targetCommitish
          ? _value.targetCommitish
          : targetCommitish // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      draft: null == draft
          ? _value.draft
          : draft // ignore: cast_nullable_to_non_nullable
              as bool,
      prerelease: null == prerelease
          ? _value.prerelease
          : prerelease // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      publishedAt: null == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tarballUrl: null == tarballUrl
          ? _value.tarballUrl
          : tarballUrl // ignore: cast_nullable_to_non_nullable
              as String,
      zipballUrl: null == zipballUrl
          ? _value.zipballUrl
          : zipballUrl // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GithubReleaseImpl
    with DiagnosticableTreeMixin
    implements _GithubRelease {
  const _$GithubReleaseImpl(
      {@JsonKey(name: 'url') required this.url,
      @JsonKey(name: 'assets_url') required this.assetsUrl,
      @JsonKey(name: 'upload_url') required this.uploadUrl,
      @JsonKey(name: 'html_url') required this.htmlUrl,
      @JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'assets') required final List<GithubAsset> assets,
      @JsonKey(name: 'author') required this.author,
      @JsonKey(name: 'node_id') required this.nodeId,
      @JsonKey(name: 'tag_name') required this.tagName,
      @JsonKey(name: 'target_commitish') required this.targetCommitish,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'draft') required this.draft,
      @JsonKey(name: 'prerelease') required this.prerelease,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'published_at') required this.publishedAt,
      @JsonKey(name: 'tarball_url') required this.tarballUrl,
      @JsonKey(name: 'zipball_url') required this.zipballUrl,
      @JsonKey(name: 'body') required this.body})
      : _assets = assets;

  factory _$GithubReleaseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GithubReleaseImplFromJson(json);

  @override
  @JsonKey(name: 'url')
  final String url;
  @override
  @JsonKey(name: 'assets_url')
  final String assetsUrl;
  @override
  @JsonKey(name: 'upload_url')
  final String uploadUrl;
  @override
  @JsonKey(name: 'html_url')
  final String htmlUrl;
  @override
  @JsonKey(name: 'id')
  final int id;
  final List<GithubAsset> _assets;
  @override
  @JsonKey(name: 'assets')
  List<GithubAsset> get assets {
    if (_assets is EqualUnmodifiableListView) return _assets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assets);
  }

  @override
  @JsonKey(name: 'author')
  final GithubAuthor author;
  @override
  @JsonKey(name: 'node_id')
  final String nodeId;
  @override
  @JsonKey(name: 'tag_name')
  final String tagName;
  @override
  @JsonKey(name: 'target_commitish')
  final String targetCommitish;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'draft')
  final bool draft;
  @override
  @JsonKey(name: 'prerelease')
  final bool prerelease;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'published_at')
  final DateTime publishedAt;
  @override
  @JsonKey(name: 'tarball_url')
  final String tarballUrl;
  @override
  @JsonKey(name: 'zipball_url')
  final String zipballUrl;
  @override
  @JsonKey(name: 'body')
  final String body;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GithubRelease(url: $url, assetsUrl: $assetsUrl, uploadUrl: $uploadUrl, htmlUrl: $htmlUrl, id: $id, assets: $assets, author: $author, nodeId: $nodeId, tagName: $tagName, targetCommitish: $targetCommitish, name: $name, draft: $draft, prerelease: $prerelease, createdAt: $createdAt, publishedAt: $publishedAt, tarballUrl: $tarballUrl, zipballUrl: $zipballUrl, body: $body)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GithubRelease'))
      ..add(DiagnosticsProperty('url', url))
      ..add(DiagnosticsProperty('assetsUrl', assetsUrl))
      ..add(DiagnosticsProperty('uploadUrl', uploadUrl))
      ..add(DiagnosticsProperty('htmlUrl', htmlUrl))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('assets', assets))
      ..add(DiagnosticsProperty('author', author))
      ..add(DiagnosticsProperty('nodeId', nodeId))
      ..add(DiagnosticsProperty('tagName', tagName))
      ..add(DiagnosticsProperty('targetCommitish', targetCommitish))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('draft', draft))
      ..add(DiagnosticsProperty('prerelease', prerelease))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('publishedAt', publishedAt))
      ..add(DiagnosticsProperty('tarballUrl', tarballUrl))
      ..add(DiagnosticsProperty('zipballUrl', zipballUrl))
      ..add(DiagnosticsProperty('body', body));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GithubReleaseImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.assetsUrl, assetsUrl) ||
                other.assetsUrl == assetsUrl) &&
            (identical(other.uploadUrl, uploadUrl) ||
                other.uploadUrl == uploadUrl) &&
            (identical(other.htmlUrl, htmlUrl) || other.htmlUrl == htmlUrl) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._assets, _assets) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.nodeId, nodeId) || other.nodeId == nodeId) &&
            (identical(other.tagName, tagName) || other.tagName == tagName) &&
            (identical(other.targetCommitish, targetCommitish) ||
                other.targetCommitish == targetCommitish) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.draft, draft) || other.draft == draft) &&
            (identical(other.prerelease, prerelease) ||
                other.prerelease == prerelease) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            (identical(other.tarballUrl, tarballUrl) ||
                other.tarballUrl == tarballUrl) &&
            (identical(other.zipballUrl, zipballUrl) ||
                other.zipballUrl == zipballUrl) &&
            (identical(other.body, body) || other.body == body));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      url,
      assetsUrl,
      uploadUrl,
      htmlUrl,
      id,
      const DeepCollectionEquality().hash(_assets),
      author,
      nodeId,
      tagName,
      targetCommitish,
      name,
      draft,
      prerelease,
      createdAt,
      publishedAt,
      tarballUrl,
      zipballUrl,
      body);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GithubReleaseImplCopyWith<_$GithubReleaseImpl> get copyWith =>
      __$$GithubReleaseImplCopyWithImpl<_$GithubReleaseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GithubReleaseImplToJson(
      this,
    );
  }
}

abstract class _GithubRelease implements GithubRelease {
  const factory _GithubRelease(
      {@JsonKey(name: 'url') required final String url,
      @JsonKey(name: 'assets_url') required final String assetsUrl,
      @JsonKey(name: 'upload_url') required final String uploadUrl,
      @JsonKey(name: 'html_url') required final String htmlUrl,
      @JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'assets') required final List<GithubAsset> assets,
      @JsonKey(name: 'author') required final GithubAuthor author,
      @JsonKey(name: 'node_id') required final String nodeId,
      @JsonKey(name: 'tag_name') required final String tagName,
      @JsonKey(name: 'target_commitish') required final String targetCommitish,
      @JsonKey(name: 'name') required final String name,
      @JsonKey(name: 'draft') required final bool draft,
      @JsonKey(name: 'prerelease') required final bool prerelease,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'published_at') required final DateTime publishedAt,
      @JsonKey(name: 'tarball_url') required final String tarballUrl,
      @JsonKey(name: 'zipball_url') required final String zipballUrl,
      @JsonKey(name: 'body') required final String body}) = _$GithubReleaseImpl;

  factory _GithubRelease.fromJson(Map<String, dynamic> json) =
      _$GithubReleaseImpl.fromJson;

  @override
  @JsonKey(name: 'url')
  String get url;
  @override
  @JsonKey(name: 'assets_url')
  String get assetsUrl;
  @override
  @JsonKey(name: 'upload_url')
  String get uploadUrl;
  @override
  @JsonKey(name: 'html_url')
  String get htmlUrl;
  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'assets')
  List<GithubAsset> get assets;
  @override
  @JsonKey(name: 'author')
  GithubAuthor get author;
  @override
  @JsonKey(name: 'node_id')
  String get nodeId;
  @override
  @JsonKey(name: 'tag_name')
  String get tagName;
  @override
  @JsonKey(name: 'target_commitish')
  String get targetCommitish;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'draft')
  bool get draft;
  @override
  @JsonKey(name: 'prerelease')
  bool get prerelease;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'published_at')
  DateTime get publishedAt;
  @override
  @JsonKey(name: 'tarball_url')
  String get tarballUrl;
  @override
  @JsonKey(name: 'zipball_url')
  String get zipballUrl;
  @override
  @JsonKey(name: 'body')
  String get body;
  @override
  @JsonKey(ignore: true)
  _$$GithubReleaseImplCopyWith<_$GithubReleaseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GithubAuthor _$GithubAuthorFromJson(Map<String, dynamic> json) {
  return _GithubAuthor.fromJson(json);
}

/// @nodoc
mixin _$GithubAuthor {
  @JsonKey(name: 'login')
  String get login => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'node_id')
  String get nodeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String get avatarUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'gravatar_id')
  String get gravatarId => throw _privateConstructorUsedError;
  @JsonKey(name: 'url')
  String get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'html_url')
  String get htmlUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'followers_url')
  String get followersUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'following_url')
  String get followingUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'gists_url')
  String get gistsUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'starred_url')
  String get starredUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'subscriptions_url')
  String get subscriptionsUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'organizations_url')
  String get organizationsUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'repos_url')
  String get reposUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'events_url')
  String get eventsUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'received_events_url')
  String get receivedEventsUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'site_admin')
  bool get siteAdmin => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GithubAuthorCopyWith<GithubAuthor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GithubAuthorCopyWith<$Res> {
  factory $GithubAuthorCopyWith(
          GithubAuthor value, $Res Function(GithubAuthor) then) =
      _$GithubAuthorCopyWithImpl<$Res, GithubAuthor>;
  @useResult
  $Res call(
      {@JsonKey(name: 'login') String login,
      @JsonKey(name: 'id') int id,
      @JsonKey(name: 'node_id') String nodeId,
      @JsonKey(name: 'avatar_url') String avatarUrl,
      @JsonKey(name: 'gravatar_id') String gravatarId,
      @JsonKey(name: 'url') String url,
      @JsonKey(name: 'html_url') String htmlUrl,
      @JsonKey(name: 'followers_url') String followersUrl,
      @JsonKey(name: 'following_url') String followingUrl,
      @JsonKey(name: 'gists_url') String gistsUrl,
      @JsonKey(name: 'starred_url') String starredUrl,
      @JsonKey(name: 'subscriptions_url') String subscriptionsUrl,
      @JsonKey(name: 'organizations_url') String organizationsUrl,
      @JsonKey(name: 'repos_url') String reposUrl,
      @JsonKey(name: 'events_url') String eventsUrl,
      @JsonKey(name: 'received_events_url') String receivedEventsUrl,
      @JsonKey(name: 'type') String type,
      @JsonKey(name: 'site_admin') bool siteAdmin});
}

/// @nodoc
class _$GithubAuthorCopyWithImpl<$Res, $Val extends GithubAuthor>
    implements $GithubAuthorCopyWith<$Res> {
  _$GithubAuthorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = null,
    Object? id = null,
    Object? nodeId = null,
    Object? avatarUrl = null,
    Object? gravatarId = null,
    Object? url = null,
    Object? htmlUrl = null,
    Object? followersUrl = null,
    Object? followingUrl = null,
    Object? gistsUrl = null,
    Object? starredUrl = null,
    Object? subscriptionsUrl = null,
    Object? organizationsUrl = null,
    Object? reposUrl = null,
    Object? eventsUrl = null,
    Object? receivedEventsUrl = null,
    Object? type = null,
    Object? siteAdmin = null,
  }) {
    return _then(_value.copyWith(
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nodeId: null == nodeId
          ? _value.nodeId
          : nodeId // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      gravatarId: null == gravatarId
          ? _value.gravatarId
          : gravatarId // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      htmlUrl: null == htmlUrl
          ? _value.htmlUrl
          : htmlUrl // ignore: cast_nullable_to_non_nullable
              as String,
      followersUrl: null == followersUrl
          ? _value.followersUrl
          : followersUrl // ignore: cast_nullable_to_non_nullable
              as String,
      followingUrl: null == followingUrl
          ? _value.followingUrl
          : followingUrl // ignore: cast_nullable_to_non_nullable
              as String,
      gistsUrl: null == gistsUrl
          ? _value.gistsUrl
          : gistsUrl // ignore: cast_nullable_to_non_nullable
              as String,
      starredUrl: null == starredUrl
          ? _value.starredUrl
          : starredUrl // ignore: cast_nullable_to_non_nullable
              as String,
      subscriptionsUrl: null == subscriptionsUrl
          ? _value.subscriptionsUrl
          : subscriptionsUrl // ignore: cast_nullable_to_non_nullable
              as String,
      organizationsUrl: null == organizationsUrl
          ? _value.organizationsUrl
          : organizationsUrl // ignore: cast_nullable_to_non_nullable
              as String,
      reposUrl: null == reposUrl
          ? _value.reposUrl
          : reposUrl // ignore: cast_nullable_to_non_nullable
              as String,
      eventsUrl: null == eventsUrl
          ? _value.eventsUrl
          : eventsUrl // ignore: cast_nullable_to_non_nullable
              as String,
      receivedEventsUrl: null == receivedEventsUrl
          ? _value.receivedEventsUrl
          : receivedEventsUrl // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      siteAdmin: null == siteAdmin
          ? _value.siteAdmin
          : siteAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GithubAuthorImplCopyWith<$Res>
    implements $GithubAuthorCopyWith<$Res> {
  factory _$$GithubAuthorImplCopyWith(
          _$GithubAuthorImpl value, $Res Function(_$GithubAuthorImpl) then) =
      __$$GithubAuthorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'login') String login,
      @JsonKey(name: 'id') int id,
      @JsonKey(name: 'node_id') String nodeId,
      @JsonKey(name: 'avatar_url') String avatarUrl,
      @JsonKey(name: 'gravatar_id') String gravatarId,
      @JsonKey(name: 'url') String url,
      @JsonKey(name: 'html_url') String htmlUrl,
      @JsonKey(name: 'followers_url') String followersUrl,
      @JsonKey(name: 'following_url') String followingUrl,
      @JsonKey(name: 'gists_url') String gistsUrl,
      @JsonKey(name: 'starred_url') String starredUrl,
      @JsonKey(name: 'subscriptions_url') String subscriptionsUrl,
      @JsonKey(name: 'organizations_url') String organizationsUrl,
      @JsonKey(name: 'repos_url') String reposUrl,
      @JsonKey(name: 'events_url') String eventsUrl,
      @JsonKey(name: 'received_events_url') String receivedEventsUrl,
      @JsonKey(name: 'type') String type,
      @JsonKey(name: 'site_admin') bool siteAdmin});
}

/// @nodoc
class __$$GithubAuthorImplCopyWithImpl<$Res>
    extends _$GithubAuthorCopyWithImpl<$Res, _$GithubAuthorImpl>
    implements _$$GithubAuthorImplCopyWith<$Res> {
  __$$GithubAuthorImplCopyWithImpl(
      _$GithubAuthorImpl _value, $Res Function(_$GithubAuthorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = null,
    Object? id = null,
    Object? nodeId = null,
    Object? avatarUrl = null,
    Object? gravatarId = null,
    Object? url = null,
    Object? htmlUrl = null,
    Object? followersUrl = null,
    Object? followingUrl = null,
    Object? gistsUrl = null,
    Object? starredUrl = null,
    Object? subscriptionsUrl = null,
    Object? organizationsUrl = null,
    Object? reposUrl = null,
    Object? eventsUrl = null,
    Object? receivedEventsUrl = null,
    Object? type = null,
    Object? siteAdmin = null,
  }) {
    return _then(_$GithubAuthorImpl(
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nodeId: null == nodeId
          ? _value.nodeId
          : nodeId // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      gravatarId: null == gravatarId
          ? _value.gravatarId
          : gravatarId // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      htmlUrl: null == htmlUrl
          ? _value.htmlUrl
          : htmlUrl // ignore: cast_nullable_to_non_nullable
              as String,
      followersUrl: null == followersUrl
          ? _value.followersUrl
          : followersUrl // ignore: cast_nullable_to_non_nullable
              as String,
      followingUrl: null == followingUrl
          ? _value.followingUrl
          : followingUrl // ignore: cast_nullable_to_non_nullable
              as String,
      gistsUrl: null == gistsUrl
          ? _value.gistsUrl
          : gistsUrl // ignore: cast_nullable_to_non_nullable
              as String,
      starredUrl: null == starredUrl
          ? _value.starredUrl
          : starredUrl // ignore: cast_nullable_to_non_nullable
              as String,
      subscriptionsUrl: null == subscriptionsUrl
          ? _value.subscriptionsUrl
          : subscriptionsUrl // ignore: cast_nullable_to_non_nullable
              as String,
      organizationsUrl: null == organizationsUrl
          ? _value.organizationsUrl
          : organizationsUrl // ignore: cast_nullable_to_non_nullable
              as String,
      reposUrl: null == reposUrl
          ? _value.reposUrl
          : reposUrl // ignore: cast_nullable_to_non_nullable
              as String,
      eventsUrl: null == eventsUrl
          ? _value.eventsUrl
          : eventsUrl // ignore: cast_nullable_to_non_nullable
              as String,
      receivedEventsUrl: null == receivedEventsUrl
          ? _value.receivedEventsUrl
          : receivedEventsUrl // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      siteAdmin: null == siteAdmin
          ? _value.siteAdmin
          : siteAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GithubAuthorImpl with DiagnosticableTreeMixin implements _GithubAuthor {
  const _$GithubAuthorImpl(
      {@JsonKey(name: 'login') required this.login,
      @JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'node_id') required this.nodeId,
      @JsonKey(name: 'avatar_url') required this.avatarUrl,
      @JsonKey(name: 'gravatar_id') required this.gravatarId,
      @JsonKey(name: 'url') required this.url,
      @JsonKey(name: 'html_url') required this.htmlUrl,
      @JsonKey(name: 'followers_url') required this.followersUrl,
      @JsonKey(name: 'following_url') required this.followingUrl,
      @JsonKey(name: 'gists_url') required this.gistsUrl,
      @JsonKey(name: 'starred_url') required this.starredUrl,
      @JsonKey(name: 'subscriptions_url') required this.subscriptionsUrl,
      @JsonKey(name: 'organizations_url') required this.organizationsUrl,
      @JsonKey(name: 'repos_url') required this.reposUrl,
      @JsonKey(name: 'events_url') required this.eventsUrl,
      @JsonKey(name: 'received_events_url') required this.receivedEventsUrl,
      @JsonKey(name: 'type') required this.type,
      @JsonKey(name: 'site_admin') required this.siteAdmin});

  factory _$GithubAuthorImpl.fromJson(Map<String, dynamic> json) =>
      _$$GithubAuthorImplFromJson(json);

  @override
  @JsonKey(name: 'login')
  final String login;
  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'node_id')
  final String nodeId;
  @override
  @JsonKey(name: 'avatar_url')
  final String avatarUrl;
  @override
  @JsonKey(name: 'gravatar_id')
  final String gravatarId;
  @override
  @JsonKey(name: 'url')
  final String url;
  @override
  @JsonKey(name: 'html_url')
  final String htmlUrl;
  @override
  @JsonKey(name: 'followers_url')
  final String followersUrl;
  @override
  @JsonKey(name: 'following_url')
  final String followingUrl;
  @override
  @JsonKey(name: 'gists_url')
  final String gistsUrl;
  @override
  @JsonKey(name: 'starred_url')
  final String starredUrl;
  @override
  @JsonKey(name: 'subscriptions_url')
  final String subscriptionsUrl;
  @override
  @JsonKey(name: 'organizations_url')
  final String organizationsUrl;
  @override
  @JsonKey(name: 'repos_url')
  final String reposUrl;
  @override
  @JsonKey(name: 'events_url')
  final String eventsUrl;
  @override
  @JsonKey(name: 'received_events_url')
  final String receivedEventsUrl;
  @override
  @JsonKey(name: 'type')
  final String type;
  @override
  @JsonKey(name: 'site_admin')
  final bool siteAdmin;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GithubAuthor(login: $login, id: $id, nodeId: $nodeId, avatarUrl: $avatarUrl, gravatarId: $gravatarId, url: $url, htmlUrl: $htmlUrl, followersUrl: $followersUrl, followingUrl: $followingUrl, gistsUrl: $gistsUrl, starredUrl: $starredUrl, subscriptionsUrl: $subscriptionsUrl, organizationsUrl: $organizationsUrl, reposUrl: $reposUrl, eventsUrl: $eventsUrl, receivedEventsUrl: $receivedEventsUrl, type: $type, siteAdmin: $siteAdmin)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GithubAuthor'))
      ..add(DiagnosticsProperty('login', login))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('nodeId', nodeId))
      ..add(DiagnosticsProperty('avatarUrl', avatarUrl))
      ..add(DiagnosticsProperty('gravatarId', gravatarId))
      ..add(DiagnosticsProperty('url', url))
      ..add(DiagnosticsProperty('htmlUrl', htmlUrl))
      ..add(DiagnosticsProperty('followersUrl', followersUrl))
      ..add(DiagnosticsProperty('followingUrl', followingUrl))
      ..add(DiagnosticsProperty('gistsUrl', gistsUrl))
      ..add(DiagnosticsProperty('starredUrl', starredUrl))
      ..add(DiagnosticsProperty('subscriptionsUrl', subscriptionsUrl))
      ..add(DiagnosticsProperty('organizationsUrl', organizationsUrl))
      ..add(DiagnosticsProperty('reposUrl', reposUrl))
      ..add(DiagnosticsProperty('eventsUrl', eventsUrl))
      ..add(DiagnosticsProperty('receivedEventsUrl', receivedEventsUrl))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('siteAdmin', siteAdmin));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GithubAuthorImpl &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nodeId, nodeId) || other.nodeId == nodeId) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.gravatarId, gravatarId) ||
                other.gravatarId == gravatarId) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.htmlUrl, htmlUrl) || other.htmlUrl == htmlUrl) &&
            (identical(other.followersUrl, followersUrl) ||
                other.followersUrl == followersUrl) &&
            (identical(other.followingUrl, followingUrl) ||
                other.followingUrl == followingUrl) &&
            (identical(other.gistsUrl, gistsUrl) ||
                other.gistsUrl == gistsUrl) &&
            (identical(other.starredUrl, starredUrl) ||
                other.starredUrl == starredUrl) &&
            (identical(other.subscriptionsUrl, subscriptionsUrl) ||
                other.subscriptionsUrl == subscriptionsUrl) &&
            (identical(other.organizationsUrl, organizationsUrl) ||
                other.organizationsUrl == organizationsUrl) &&
            (identical(other.reposUrl, reposUrl) ||
                other.reposUrl == reposUrl) &&
            (identical(other.eventsUrl, eventsUrl) ||
                other.eventsUrl == eventsUrl) &&
            (identical(other.receivedEventsUrl, receivedEventsUrl) ||
                other.receivedEventsUrl == receivedEventsUrl) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.siteAdmin, siteAdmin) ||
                other.siteAdmin == siteAdmin));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      login,
      id,
      nodeId,
      avatarUrl,
      gravatarId,
      url,
      htmlUrl,
      followersUrl,
      followingUrl,
      gistsUrl,
      starredUrl,
      subscriptionsUrl,
      organizationsUrl,
      reposUrl,
      eventsUrl,
      receivedEventsUrl,
      type,
      siteAdmin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GithubAuthorImplCopyWith<_$GithubAuthorImpl> get copyWith =>
      __$$GithubAuthorImplCopyWithImpl<_$GithubAuthorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GithubAuthorImplToJson(
      this,
    );
  }
}

abstract class _GithubAuthor implements GithubAuthor {
  const factory _GithubAuthor(
          {@JsonKey(name: 'login') required final String login,
          @JsonKey(name: 'id') required final int id,
          @JsonKey(name: 'node_id') required final String nodeId,
          @JsonKey(name: 'avatar_url') required final String avatarUrl,
          @JsonKey(name: 'gravatar_id') required final String gravatarId,
          @JsonKey(name: 'url') required final String url,
          @JsonKey(name: 'html_url') required final String htmlUrl,
          @JsonKey(name: 'followers_url') required final String followersUrl,
          @JsonKey(name: 'following_url') required final String followingUrl,
          @JsonKey(name: 'gists_url') required final String gistsUrl,
          @JsonKey(name: 'starred_url') required final String starredUrl,
          @JsonKey(name: 'subscriptions_url')
          required final String subscriptionsUrl,
          @JsonKey(name: 'organizations_url')
          required final String organizationsUrl,
          @JsonKey(name: 'repos_url') required final String reposUrl,
          @JsonKey(name: 'events_url') required final String eventsUrl,
          @JsonKey(name: 'received_events_url')
          required final String receivedEventsUrl,
          @JsonKey(name: 'type') required final String type,
          @JsonKey(name: 'site_admin') required final bool siteAdmin}) =
      _$GithubAuthorImpl;

  factory _GithubAuthor.fromJson(Map<String, dynamic> json) =
      _$GithubAuthorImpl.fromJson;

  @override
  @JsonKey(name: 'login')
  String get login;
  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'node_id')
  String get nodeId;
  @override
  @JsonKey(name: 'avatar_url')
  String get avatarUrl;
  @override
  @JsonKey(name: 'gravatar_id')
  String get gravatarId;
  @override
  @JsonKey(name: 'url')
  String get url;
  @override
  @JsonKey(name: 'html_url')
  String get htmlUrl;
  @override
  @JsonKey(name: 'followers_url')
  String get followersUrl;
  @override
  @JsonKey(name: 'following_url')
  String get followingUrl;
  @override
  @JsonKey(name: 'gists_url')
  String get gistsUrl;
  @override
  @JsonKey(name: 'starred_url')
  String get starredUrl;
  @override
  @JsonKey(name: 'subscriptions_url')
  String get subscriptionsUrl;
  @override
  @JsonKey(name: 'organizations_url')
  String get organizationsUrl;
  @override
  @JsonKey(name: 'repos_url')
  String get reposUrl;
  @override
  @JsonKey(name: 'events_url')
  String get eventsUrl;
  @override
  @JsonKey(name: 'received_events_url')
  String get receivedEventsUrl;
  @override
  @JsonKey(name: 'type')
  String get type;
  @override
  @JsonKey(name: 'site_admin')
  bool get siteAdmin;
  @override
  @JsonKey(ignore: true)
  _$$GithubAuthorImplCopyWith<_$GithubAuthorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GithubAsset _$GithubAssetFromJson(Map<String, dynamic> json) {
  return _GithubAsset.fromJson(json);
}

/// @nodoc
mixin _$GithubAsset {
  @JsonKey(name: 'url')
  String get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'node_id')
  String get nodeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'label')
  String? get label => throw _privateConstructorUsedError;
  @JsonKey(name: 'uploader')
  GithubUploader get uploader => throw _privateConstructorUsedError;
  @JsonKey(name: 'content_type')
  String get contentType => throw _privateConstructorUsedError;
  @JsonKey(name: 'state')
  String get state => throw _privateConstructorUsedError;
  @JsonKey(name: 'size')
  int get size => throw _privateConstructorUsedError;
  @JsonKey(name: 'download_count')
  int get downloadCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'browser_download_url')
  String get browserDownloadUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GithubAssetCopyWith<GithubAsset> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GithubAssetCopyWith<$Res> {
  factory $GithubAssetCopyWith(
          GithubAsset value, $Res Function(GithubAsset) then) =
      _$GithubAssetCopyWithImpl<$Res, GithubAsset>;
  @useResult
  $Res call(
      {@JsonKey(name: 'url') String url,
      @JsonKey(name: 'id') int id,
      @JsonKey(name: 'node_id') String nodeId,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'label') String? label,
      @JsonKey(name: 'uploader') GithubUploader uploader,
      @JsonKey(name: 'content_type') String contentType,
      @JsonKey(name: 'state') String state,
      @JsonKey(name: 'size') int size,
      @JsonKey(name: 'download_count') int downloadCount,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'browser_download_url') String browserDownloadUrl});

  $GithubUploaderCopyWith<$Res> get uploader;
}

/// @nodoc
class _$GithubAssetCopyWithImpl<$Res, $Val extends GithubAsset>
    implements $GithubAssetCopyWith<$Res> {
  _$GithubAssetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? id = null,
    Object? nodeId = null,
    Object? name = null,
    Object? label = freezed,
    Object? uploader = null,
    Object? contentType = null,
    Object? state = null,
    Object? size = null,
    Object? downloadCount = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? browserDownloadUrl = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nodeId: null == nodeId
          ? _value.nodeId
          : nodeId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      uploader: null == uploader
          ? _value.uploader
          : uploader // ignore: cast_nullable_to_non_nullable
              as GithubUploader,
      contentType: null == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      downloadCount: null == downloadCount
          ? _value.downloadCount
          : downloadCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      browserDownloadUrl: null == browserDownloadUrl
          ? _value.browserDownloadUrl
          : browserDownloadUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GithubUploaderCopyWith<$Res> get uploader {
    return $GithubUploaderCopyWith<$Res>(_value.uploader, (value) {
      return _then(_value.copyWith(uploader: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GithubAssetImplCopyWith<$Res>
    implements $GithubAssetCopyWith<$Res> {
  factory _$$GithubAssetImplCopyWith(
          _$GithubAssetImpl value, $Res Function(_$GithubAssetImpl) then) =
      __$$GithubAssetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'url') String url,
      @JsonKey(name: 'id') int id,
      @JsonKey(name: 'node_id') String nodeId,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'label') String? label,
      @JsonKey(name: 'uploader') GithubUploader uploader,
      @JsonKey(name: 'content_type') String contentType,
      @JsonKey(name: 'state') String state,
      @JsonKey(name: 'size') int size,
      @JsonKey(name: 'download_count') int downloadCount,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'browser_download_url') String browserDownloadUrl});

  @override
  $GithubUploaderCopyWith<$Res> get uploader;
}

/// @nodoc
class __$$GithubAssetImplCopyWithImpl<$Res>
    extends _$GithubAssetCopyWithImpl<$Res, _$GithubAssetImpl>
    implements _$$GithubAssetImplCopyWith<$Res> {
  __$$GithubAssetImplCopyWithImpl(
      _$GithubAssetImpl _value, $Res Function(_$GithubAssetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? id = null,
    Object? nodeId = null,
    Object? name = null,
    Object? label = freezed,
    Object? uploader = null,
    Object? contentType = null,
    Object? state = null,
    Object? size = null,
    Object? downloadCount = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? browserDownloadUrl = null,
  }) {
    return _then(_$GithubAssetImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nodeId: null == nodeId
          ? _value.nodeId
          : nodeId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      uploader: null == uploader
          ? _value.uploader
          : uploader // ignore: cast_nullable_to_non_nullable
              as GithubUploader,
      contentType: null == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      downloadCount: null == downloadCount
          ? _value.downloadCount
          : downloadCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      browserDownloadUrl: null == browserDownloadUrl
          ? _value.browserDownloadUrl
          : browserDownloadUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GithubAssetImpl with DiagnosticableTreeMixin implements _GithubAsset {
  const _$GithubAssetImpl(
      {@JsonKey(name: 'url') required this.url,
      @JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'node_id') required this.nodeId,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'label') this.label,
      @JsonKey(name: 'uploader') required this.uploader,
      @JsonKey(name: 'content_type') required this.contentType,
      @JsonKey(name: 'state') required this.state,
      @JsonKey(name: 'size') required this.size,
      @JsonKey(name: 'download_count') required this.downloadCount,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'browser_download_url') required this.browserDownloadUrl});

  factory _$GithubAssetImpl.fromJson(Map<String, dynamic> json) =>
      _$$GithubAssetImplFromJson(json);

  @override
  @JsonKey(name: 'url')
  final String url;
  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'node_id')
  final String nodeId;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'label')
  final String? label;
  @override
  @JsonKey(name: 'uploader')
  final GithubUploader uploader;
  @override
  @JsonKey(name: 'content_type')
  final String contentType;
  @override
  @JsonKey(name: 'state')
  final String state;
  @override
  @JsonKey(name: 'size')
  final int size;
  @override
  @JsonKey(name: 'download_count')
  final int downloadCount;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'browser_download_url')
  final String browserDownloadUrl;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GithubAsset(url: $url, id: $id, nodeId: $nodeId, name: $name, label: $label, uploader: $uploader, contentType: $contentType, state: $state, size: $size, downloadCount: $downloadCount, createdAt: $createdAt, updatedAt: $updatedAt, browserDownloadUrl: $browserDownloadUrl)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GithubAsset'))
      ..add(DiagnosticsProperty('url', url))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('nodeId', nodeId))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('label', label))
      ..add(DiagnosticsProperty('uploader', uploader))
      ..add(DiagnosticsProperty('contentType', contentType))
      ..add(DiagnosticsProperty('state', state))
      ..add(DiagnosticsProperty('size', size))
      ..add(DiagnosticsProperty('downloadCount', downloadCount))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('browserDownloadUrl', browserDownloadUrl));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GithubAssetImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nodeId, nodeId) || other.nodeId == nodeId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.uploader, uploader) ||
                other.uploader == uploader) &&
            (identical(other.contentType, contentType) ||
                other.contentType == contentType) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.downloadCount, downloadCount) ||
                other.downloadCount == downloadCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.browserDownloadUrl, browserDownloadUrl) ||
                other.browserDownloadUrl == browserDownloadUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      url,
      id,
      nodeId,
      name,
      label,
      uploader,
      contentType,
      state,
      size,
      downloadCount,
      createdAt,
      updatedAt,
      browserDownloadUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GithubAssetImplCopyWith<_$GithubAssetImpl> get copyWith =>
      __$$GithubAssetImplCopyWithImpl<_$GithubAssetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GithubAssetImplToJson(
      this,
    );
  }
}

abstract class _GithubAsset implements GithubAsset {
  const factory _GithubAsset(
      {@JsonKey(name: 'url') required final String url,
      @JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'node_id') required final String nodeId,
      @JsonKey(name: 'name') required final String name,
      @JsonKey(name: 'label') final String? label,
      @JsonKey(name: 'uploader') required final GithubUploader uploader,
      @JsonKey(name: 'content_type') required final String contentType,
      @JsonKey(name: 'state') required final String state,
      @JsonKey(name: 'size') required final int size,
      @JsonKey(name: 'download_count') required final int downloadCount,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'updated_at') required final DateTime updatedAt,
      @JsonKey(name: 'browser_download_url')
      required final String browserDownloadUrl}) = _$GithubAssetImpl;

  factory _GithubAsset.fromJson(Map<String, dynamic> json) =
      _$GithubAssetImpl.fromJson;

  @override
  @JsonKey(name: 'url')
  String get url;
  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'node_id')
  String get nodeId;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'label')
  String? get label;
  @override
  @JsonKey(name: 'uploader')
  GithubUploader get uploader;
  @override
  @JsonKey(name: 'content_type')
  String get contentType;
  @override
  @JsonKey(name: 'state')
  String get state;
  @override
  @JsonKey(name: 'size')
  int get size;
  @override
  @JsonKey(name: 'download_count')
  int get downloadCount;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'browser_download_url')
  String get browserDownloadUrl;
  @override
  @JsonKey(ignore: true)
  _$$GithubAssetImplCopyWith<_$GithubAssetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GithubUploader _$GithubUploaderFromJson(Map<String, dynamic> json) {
  return _GithubUploader.fromJson(json);
}

/// @nodoc
mixin _$GithubUploader {
  @JsonKey(name: 'login')
  String get login => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'node_id')
  String get nodeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String get avatarUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'gravatar_id')
  String get gravatarId => throw _privateConstructorUsedError;
  @JsonKey(name: 'url')
  String get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'html_url')
  String get htmlUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'followers_url')
  String get followersUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'following_url')
  String get followingUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'gists_url')
  String get gistsUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'starred_url')
  String get starredUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'subscriptions_url')
  String get subscriptionsUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'organizations_url')
  String get organizationsUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'repos_url')
  String get reposUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'events_url')
  String get eventsUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'received_events_url')
  String get receivedEventsUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'site_admin')
  bool get siteAdmin => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GithubUploaderCopyWith<GithubUploader> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GithubUploaderCopyWith<$Res> {
  factory $GithubUploaderCopyWith(
          GithubUploader value, $Res Function(GithubUploader) then) =
      _$GithubUploaderCopyWithImpl<$Res, GithubUploader>;
  @useResult
  $Res call(
      {@JsonKey(name: 'login') String login,
      @JsonKey(name: 'id') int id,
      @JsonKey(name: 'node_id') String nodeId,
      @JsonKey(name: 'avatar_url') String avatarUrl,
      @JsonKey(name: 'gravatar_id') String gravatarId,
      @JsonKey(name: 'url') String url,
      @JsonKey(name: 'html_url') String htmlUrl,
      @JsonKey(name: 'followers_url') String followersUrl,
      @JsonKey(name: 'following_url') String followingUrl,
      @JsonKey(name: 'gists_url') String gistsUrl,
      @JsonKey(name: 'starred_url') String starredUrl,
      @JsonKey(name: 'subscriptions_url') String subscriptionsUrl,
      @JsonKey(name: 'organizations_url') String organizationsUrl,
      @JsonKey(name: 'repos_url') String reposUrl,
      @JsonKey(name: 'events_url') String eventsUrl,
      @JsonKey(name: 'received_events_url') String receivedEventsUrl,
      @JsonKey(name: 'type') String type,
      @JsonKey(name: 'site_admin') bool siteAdmin});
}

/// @nodoc
class _$GithubUploaderCopyWithImpl<$Res, $Val extends GithubUploader>
    implements $GithubUploaderCopyWith<$Res> {
  _$GithubUploaderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = null,
    Object? id = null,
    Object? nodeId = null,
    Object? avatarUrl = null,
    Object? gravatarId = null,
    Object? url = null,
    Object? htmlUrl = null,
    Object? followersUrl = null,
    Object? followingUrl = null,
    Object? gistsUrl = null,
    Object? starredUrl = null,
    Object? subscriptionsUrl = null,
    Object? organizationsUrl = null,
    Object? reposUrl = null,
    Object? eventsUrl = null,
    Object? receivedEventsUrl = null,
    Object? type = null,
    Object? siteAdmin = null,
  }) {
    return _then(_value.copyWith(
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nodeId: null == nodeId
          ? _value.nodeId
          : nodeId // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      gravatarId: null == gravatarId
          ? _value.gravatarId
          : gravatarId // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      htmlUrl: null == htmlUrl
          ? _value.htmlUrl
          : htmlUrl // ignore: cast_nullable_to_non_nullable
              as String,
      followersUrl: null == followersUrl
          ? _value.followersUrl
          : followersUrl // ignore: cast_nullable_to_non_nullable
              as String,
      followingUrl: null == followingUrl
          ? _value.followingUrl
          : followingUrl // ignore: cast_nullable_to_non_nullable
              as String,
      gistsUrl: null == gistsUrl
          ? _value.gistsUrl
          : gistsUrl // ignore: cast_nullable_to_non_nullable
              as String,
      starredUrl: null == starredUrl
          ? _value.starredUrl
          : starredUrl // ignore: cast_nullable_to_non_nullable
              as String,
      subscriptionsUrl: null == subscriptionsUrl
          ? _value.subscriptionsUrl
          : subscriptionsUrl // ignore: cast_nullable_to_non_nullable
              as String,
      organizationsUrl: null == organizationsUrl
          ? _value.organizationsUrl
          : organizationsUrl // ignore: cast_nullable_to_non_nullable
              as String,
      reposUrl: null == reposUrl
          ? _value.reposUrl
          : reposUrl // ignore: cast_nullable_to_non_nullable
              as String,
      eventsUrl: null == eventsUrl
          ? _value.eventsUrl
          : eventsUrl // ignore: cast_nullable_to_non_nullable
              as String,
      receivedEventsUrl: null == receivedEventsUrl
          ? _value.receivedEventsUrl
          : receivedEventsUrl // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      siteAdmin: null == siteAdmin
          ? _value.siteAdmin
          : siteAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GithubUploaderImplCopyWith<$Res>
    implements $GithubUploaderCopyWith<$Res> {
  factory _$$GithubUploaderImplCopyWith(_$GithubUploaderImpl value,
          $Res Function(_$GithubUploaderImpl) then) =
      __$$GithubUploaderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'login') String login,
      @JsonKey(name: 'id') int id,
      @JsonKey(name: 'node_id') String nodeId,
      @JsonKey(name: 'avatar_url') String avatarUrl,
      @JsonKey(name: 'gravatar_id') String gravatarId,
      @JsonKey(name: 'url') String url,
      @JsonKey(name: 'html_url') String htmlUrl,
      @JsonKey(name: 'followers_url') String followersUrl,
      @JsonKey(name: 'following_url') String followingUrl,
      @JsonKey(name: 'gists_url') String gistsUrl,
      @JsonKey(name: 'starred_url') String starredUrl,
      @JsonKey(name: 'subscriptions_url') String subscriptionsUrl,
      @JsonKey(name: 'organizations_url') String organizationsUrl,
      @JsonKey(name: 'repos_url') String reposUrl,
      @JsonKey(name: 'events_url') String eventsUrl,
      @JsonKey(name: 'received_events_url') String receivedEventsUrl,
      @JsonKey(name: 'type') String type,
      @JsonKey(name: 'site_admin') bool siteAdmin});
}

/// @nodoc
class __$$GithubUploaderImplCopyWithImpl<$Res>
    extends _$GithubUploaderCopyWithImpl<$Res, _$GithubUploaderImpl>
    implements _$$GithubUploaderImplCopyWith<$Res> {
  __$$GithubUploaderImplCopyWithImpl(
      _$GithubUploaderImpl _value, $Res Function(_$GithubUploaderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = null,
    Object? id = null,
    Object? nodeId = null,
    Object? avatarUrl = null,
    Object? gravatarId = null,
    Object? url = null,
    Object? htmlUrl = null,
    Object? followersUrl = null,
    Object? followingUrl = null,
    Object? gistsUrl = null,
    Object? starredUrl = null,
    Object? subscriptionsUrl = null,
    Object? organizationsUrl = null,
    Object? reposUrl = null,
    Object? eventsUrl = null,
    Object? receivedEventsUrl = null,
    Object? type = null,
    Object? siteAdmin = null,
  }) {
    return _then(_$GithubUploaderImpl(
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nodeId: null == nodeId
          ? _value.nodeId
          : nodeId // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      gravatarId: null == gravatarId
          ? _value.gravatarId
          : gravatarId // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      htmlUrl: null == htmlUrl
          ? _value.htmlUrl
          : htmlUrl // ignore: cast_nullable_to_non_nullable
              as String,
      followersUrl: null == followersUrl
          ? _value.followersUrl
          : followersUrl // ignore: cast_nullable_to_non_nullable
              as String,
      followingUrl: null == followingUrl
          ? _value.followingUrl
          : followingUrl // ignore: cast_nullable_to_non_nullable
              as String,
      gistsUrl: null == gistsUrl
          ? _value.gistsUrl
          : gistsUrl // ignore: cast_nullable_to_non_nullable
              as String,
      starredUrl: null == starredUrl
          ? _value.starredUrl
          : starredUrl // ignore: cast_nullable_to_non_nullable
              as String,
      subscriptionsUrl: null == subscriptionsUrl
          ? _value.subscriptionsUrl
          : subscriptionsUrl // ignore: cast_nullable_to_non_nullable
              as String,
      organizationsUrl: null == organizationsUrl
          ? _value.organizationsUrl
          : organizationsUrl // ignore: cast_nullable_to_non_nullable
              as String,
      reposUrl: null == reposUrl
          ? _value.reposUrl
          : reposUrl // ignore: cast_nullable_to_non_nullable
              as String,
      eventsUrl: null == eventsUrl
          ? _value.eventsUrl
          : eventsUrl // ignore: cast_nullable_to_non_nullable
              as String,
      receivedEventsUrl: null == receivedEventsUrl
          ? _value.receivedEventsUrl
          : receivedEventsUrl // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      siteAdmin: null == siteAdmin
          ? _value.siteAdmin
          : siteAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GithubUploaderImpl
    with DiagnosticableTreeMixin
    implements _GithubUploader {
  const _$GithubUploaderImpl(
      {@JsonKey(name: 'login') required this.login,
      @JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'node_id') required this.nodeId,
      @JsonKey(name: 'avatar_url') required this.avatarUrl,
      @JsonKey(name: 'gravatar_id') required this.gravatarId,
      @JsonKey(name: 'url') required this.url,
      @JsonKey(name: 'html_url') required this.htmlUrl,
      @JsonKey(name: 'followers_url') required this.followersUrl,
      @JsonKey(name: 'following_url') required this.followingUrl,
      @JsonKey(name: 'gists_url') required this.gistsUrl,
      @JsonKey(name: 'starred_url') required this.starredUrl,
      @JsonKey(name: 'subscriptions_url') required this.subscriptionsUrl,
      @JsonKey(name: 'organizations_url') required this.organizationsUrl,
      @JsonKey(name: 'repos_url') required this.reposUrl,
      @JsonKey(name: 'events_url') required this.eventsUrl,
      @JsonKey(name: 'received_events_url') required this.receivedEventsUrl,
      @JsonKey(name: 'type') required this.type,
      @JsonKey(name: 'site_admin') required this.siteAdmin});

  factory _$GithubUploaderImpl.fromJson(Map<String, dynamic> json) =>
      _$$GithubUploaderImplFromJson(json);

  @override
  @JsonKey(name: 'login')
  final String login;
  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'node_id')
  final String nodeId;
  @override
  @JsonKey(name: 'avatar_url')
  final String avatarUrl;
  @override
  @JsonKey(name: 'gravatar_id')
  final String gravatarId;
  @override
  @JsonKey(name: 'url')
  final String url;
  @override
  @JsonKey(name: 'html_url')
  final String htmlUrl;
  @override
  @JsonKey(name: 'followers_url')
  final String followersUrl;
  @override
  @JsonKey(name: 'following_url')
  final String followingUrl;
  @override
  @JsonKey(name: 'gists_url')
  final String gistsUrl;
  @override
  @JsonKey(name: 'starred_url')
  final String starredUrl;
  @override
  @JsonKey(name: 'subscriptions_url')
  final String subscriptionsUrl;
  @override
  @JsonKey(name: 'organizations_url')
  final String organizationsUrl;
  @override
  @JsonKey(name: 'repos_url')
  final String reposUrl;
  @override
  @JsonKey(name: 'events_url')
  final String eventsUrl;
  @override
  @JsonKey(name: 'received_events_url')
  final String receivedEventsUrl;
  @override
  @JsonKey(name: 'type')
  final String type;
  @override
  @JsonKey(name: 'site_admin')
  final bool siteAdmin;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GithubUploader(login: $login, id: $id, nodeId: $nodeId, avatarUrl: $avatarUrl, gravatarId: $gravatarId, url: $url, htmlUrl: $htmlUrl, followersUrl: $followersUrl, followingUrl: $followingUrl, gistsUrl: $gistsUrl, starredUrl: $starredUrl, subscriptionsUrl: $subscriptionsUrl, organizationsUrl: $organizationsUrl, reposUrl: $reposUrl, eventsUrl: $eventsUrl, receivedEventsUrl: $receivedEventsUrl, type: $type, siteAdmin: $siteAdmin)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GithubUploader'))
      ..add(DiagnosticsProperty('login', login))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('nodeId', nodeId))
      ..add(DiagnosticsProperty('avatarUrl', avatarUrl))
      ..add(DiagnosticsProperty('gravatarId', gravatarId))
      ..add(DiagnosticsProperty('url', url))
      ..add(DiagnosticsProperty('htmlUrl', htmlUrl))
      ..add(DiagnosticsProperty('followersUrl', followersUrl))
      ..add(DiagnosticsProperty('followingUrl', followingUrl))
      ..add(DiagnosticsProperty('gistsUrl', gistsUrl))
      ..add(DiagnosticsProperty('starredUrl', starredUrl))
      ..add(DiagnosticsProperty('subscriptionsUrl', subscriptionsUrl))
      ..add(DiagnosticsProperty('organizationsUrl', organizationsUrl))
      ..add(DiagnosticsProperty('reposUrl', reposUrl))
      ..add(DiagnosticsProperty('eventsUrl', eventsUrl))
      ..add(DiagnosticsProperty('receivedEventsUrl', receivedEventsUrl))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('siteAdmin', siteAdmin));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GithubUploaderImpl &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nodeId, nodeId) || other.nodeId == nodeId) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.gravatarId, gravatarId) ||
                other.gravatarId == gravatarId) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.htmlUrl, htmlUrl) || other.htmlUrl == htmlUrl) &&
            (identical(other.followersUrl, followersUrl) ||
                other.followersUrl == followersUrl) &&
            (identical(other.followingUrl, followingUrl) ||
                other.followingUrl == followingUrl) &&
            (identical(other.gistsUrl, gistsUrl) ||
                other.gistsUrl == gistsUrl) &&
            (identical(other.starredUrl, starredUrl) ||
                other.starredUrl == starredUrl) &&
            (identical(other.subscriptionsUrl, subscriptionsUrl) ||
                other.subscriptionsUrl == subscriptionsUrl) &&
            (identical(other.organizationsUrl, organizationsUrl) ||
                other.organizationsUrl == organizationsUrl) &&
            (identical(other.reposUrl, reposUrl) ||
                other.reposUrl == reposUrl) &&
            (identical(other.eventsUrl, eventsUrl) ||
                other.eventsUrl == eventsUrl) &&
            (identical(other.receivedEventsUrl, receivedEventsUrl) ||
                other.receivedEventsUrl == receivedEventsUrl) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.siteAdmin, siteAdmin) ||
                other.siteAdmin == siteAdmin));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      login,
      id,
      nodeId,
      avatarUrl,
      gravatarId,
      url,
      htmlUrl,
      followersUrl,
      followingUrl,
      gistsUrl,
      starredUrl,
      subscriptionsUrl,
      organizationsUrl,
      reposUrl,
      eventsUrl,
      receivedEventsUrl,
      type,
      siteAdmin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GithubUploaderImplCopyWith<_$GithubUploaderImpl> get copyWith =>
      __$$GithubUploaderImplCopyWithImpl<_$GithubUploaderImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GithubUploaderImplToJson(
      this,
    );
  }
}

abstract class _GithubUploader implements GithubUploader {
  const factory _GithubUploader(
          {@JsonKey(name: 'login') required final String login,
          @JsonKey(name: 'id') required final int id,
          @JsonKey(name: 'node_id') required final String nodeId,
          @JsonKey(name: 'avatar_url') required final String avatarUrl,
          @JsonKey(name: 'gravatar_id') required final String gravatarId,
          @JsonKey(name: 'url') required final String url,
          @JsonKey(name: 'html_url') required final String htmlUrl,
          @JsonKey(name: 'followers_url') required final String followersUrl,
          @JsonKey(name: 'following_url') required final String followingUrl,
          @JsonKey(name: 'gists_url') required final String gistsUrl,
          @JsonKey(name: 'starred_url') required final String starredUrl,
          @JsonKey(name: 'subscriptions_url')
          required final String subscriptionsUrl,
          @JsonKey(name: 'organizations_url')
          required final String organizationsUrl,
          @JsonKey(name: 'repos_url') required final String reposUrl,
          @JsonKey(name: 'events_url') required final String eventsUrl,
          @JsonKey(name: 'received_events_url')
          required final String receivedEventsUrl,
          @JsonKey(name: 'type') required final String type,
          @JsonKey(name: 'site_admin') required final bool siteAdmin}) =
      _$GithubUploaderImpl;

  factory _GithubUploader.fromJson(Map<String, dynamic> json) =
      _$GithubUploaderImpl.fromJson;

  @override
  @JsonKey(name: 'login')
  String get login;
  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'node_id')
  String get nodeId;
  @override
  @JsonKey(name: 'avatar_url')
  String get avatarUrl;
  @override
  @JsonKey(name: 'gravatar_id')
  String get gravatarId;
  @override
  @JsonKey(name: 'url')
  String get url;
  @override
  @JsonKey(name: 'html_url')
  String get htmlUrl;
  @override
  @JsonKey(name: 'followers_url')
  String get followersUrl;
  @override
  @JsonKey(name: 'following_url')
  String get followingUrl;
  @override
  @JsonKey(name: 'gists_url')
  String get gistsUrl;
  @override
  @JsonKey(name: 'starred_url')
  String get starredUrl;
  @override
  @JsonKey(name: 'subscriptions_url')
  String get subscriptionsUrl;
  @override
  @JsonKey(name: 'organizations_url')
  String get organizationsUrl;
  @override
  @JsonKey(name: 'repos_url')
  String get reposUrl;
  @override
  @JsonKey(name: 'events_url')
  String get eventsUrl;
  @override
  @JsonKey(name: 'received_events_url')
  String get receivedEventsUrl;
  @override
  @JsonKey(name: 'type')
  String get type;
  @override
  @JsonKey(name: 'site_admin')
  bool get siteAdmin;
  @override
  @JsonKey(ignore: true)
  _$$GithubUploaderImplCopyWith<_$GithubUploaderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
