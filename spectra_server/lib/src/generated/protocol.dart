/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i3;
import 'artwork.dart' as _i4;
import 'artwork_comment.dart' as _i5;
import 'artwork_comment_likes.dart' as _i6;
import 'artwork_comment_list.dart' as _i7;
import 'artwork_comment_updates.dart' as _i8;
import 'artwork_comment_with_user_state.dart' as _i9;
import 'artwork_data.dart' as _i10;
import 'artwork_downloads.dart' as _i11;
import 'artwork_list.dart' as _i12;
import 'artwork_models.dart' as _i13;
import 'artwork_tags.dart' as _i14;
import 'artwork_updates.dart' as _i15;
import 'artwork_views.dart' as _i16;
import 'artwork_with_user_state.dart' as _i17;
import 'atwork_likes.dart' as _i18;
import 'comment_type.dart' as _i19;
import 'exception.dart' as _i20;
import 'filters.dart' as _i21;
import 'follower.dart' as _i22;
import 'media_type.dart' as _i23;
import 'model.dart' as _i24;
import 'models_list.dart' as _i25;
import 'presigned_url_request.dart' as _i26;
import 'presigned_url_response.dart' as _i27;
import 'search_vector_response.dart' as _i28;
import 'tag.dart' as _i29;
import 'tags_list.dart' as _i30;
import 'user.dart' as _i31;
import 'user_with_state.dart' as _i32;
import 'package:spectra_server/src/generated/presigned_url_response.dart'
    as _i33;
import 'package:spectra_server/src/generated/presigned_url_request.dart'
    as _i34;
export 'artwork.dart';
export 'artwork_comment.dart';
export 'artwork_comment_likes.dart';
export 'artwork_comment_list.dart';
export 'artwork_comment_updates.dart';
export 'artwork_comment_with_user_state.dart';
export 'artwork_data.dart';
export 'artwork_downloads.dart';
export 'artwork_list.dart';
export 'artwork_models.dart';
export 'artwork_tags.dart';
export 'artwork_updates.dart';
export 'artwork_views.dart';
export 'artwork_with_user_state.dart';
export 'atwork_likes.dart';
export 'comment_type.dart';
export 'exception.dart';
export 'filters.dart';
export 'follower.dart';
export 'media_type.dart';
export 'model.dart';
export 'models_list.dart';
export 'presigned_url_request.dart';
export 'presigned_url_response.dart';
export 'search_vector_response.dart';
export 'tag.dart';
export 'tags_list.dart';
export 'user.dart';
export 'user_with_state.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'artwork',
      dartName: 'Artwork',
      schema: 'public',
      module: 'spectra',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'artwork_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'mediaUrl',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<String>?',
        ),
        _i2.ColumnDefinition(
          name: 'thumbnailUrl',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<String>?',
        ),
        _i2.ColumnDefinition(
          name: 'mediaType',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'protocol:MediaType?',
        ),
        _i2.ColumnDefinition(
          name: 'tagNames',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<String>?',
        ),
        _i2.ColumnDefinition(
          name: 'prompt',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'modelNames',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<String>?',
        ),
        _i2.ColumnDefinition(
          name: 'resolution',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<String>?',
        ),
        _i2.ColumnDefinition(
          name: 'allowDownload',
          columnType: _i2.ColumnType.boolean,
          isNullable: true,
          dartType: 'bool?',
          columnDefault: 'true',
        ),
        _i2.ColumnDefinition(
          name: 'views',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
          columnDefault: '0',
        ),
        _i2.ColumnDefinition(
          name: 'likes',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
          columnDefault: '0',
        ),
        _i2.ColumnDefinition(
          name: 'downloads',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
          columnDefault: '0',
        ),
        _i2.ColumnDefinition(
          name: 'taggedUsers',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<protocol:User>?',
        ),
        _i2.ColumnDefinition(
          name: 'commentsCount',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
          columnDefault: '0',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'videoDuration',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'showPrompt',
          columnType: _i2.ColumnType.boolean,
          isNullable: true,
          dartType: 'bool?',
          columnDefault: 'true',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'artwork_fk_0',
          columns: ['userId'],
          referenceTable: 'user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'artwork_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'artwork_comment',
      dartName: 'ArtworkComment',
      schema: 'public',
      module: 'spectra',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'artwork_comment_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'artworkId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'ownerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'text',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'dateCreated',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'likesCount',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
          columnDefault: '0',
        ),
        _i2.ColumnDefinition(
          name: 'repliesCount',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
          columnDefault: '0',
        ),
        _i2.ColumnDefinition(
          name: 'parentId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'isDeleted',
          columnType: _i2.ColumnType.boolean,
          isNullable: true,
          dartType: 'bool?',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'protocol:CommentType?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'artwork_comment_fk_0',
          columns: ['artworkId'],
          referenceTable: 'artwork',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'artwork_comment_fk_1',
          columns: ['ownerId'],
          referenceTable: 'user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'artwork_comment_fk_2',
          columns: ['parentId'],
          referenceTable: 'artwork_comment',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.setNull,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'artwork_comment_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'artwork_comment_likes',
      dartName: 'ArtworkCommentLikes',
      schema: 'public',
      module: 'spectra',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'artwork_comment_likes_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'artworkCommentId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'likedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'dateCreated',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'artwork_comment_likes_fk_0',
          columns: ['artworkCommentId'],
          referenceTable: 'artwork_comment',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'artwork_comment_likes_fk_1',
          columns: ['likedById'],
          referenceTable: 'user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'artwork_comment_likes_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'artwork_comment_likes_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'artworkCommentId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'likedById',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'artwork_downloads',
      dartName: 'ArtworkDownloads',
      schema: 'public',
      module: 'spectra',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'artwork_downloads_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'artworkId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'downloadedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'dateCreated',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'artwork_downloads_fk_0',
          columns: ['artworkId'],
          referenceTable: 'artwork',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'artwork_downloads_fk_1',
          columns: ['downloadedById'],
          referenceTable: 'user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'artwork_downloads_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'artwork_downloads_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'artworkId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'downloadedById',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'artwork_likes',
      dartName: 'ArtworkLikes',
      schema: 'public',
      module: 'spectra',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'artwork_likes_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'artworkId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'likedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'dateCreated',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'artwork_likes_fk_0',
          columns: ['artworkId'],
          referenceTable: 'artwork',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'artwork_likes_fk_1',
          columns: ['likedById'],
          referenceTable: 'user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'artwork_likes_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'artwork_likes_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'artworkId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'likedById',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'artwork_models',
      dartName: 'ArtworkModels',
      schema: 'public',
      module: 'spectra',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'artwork_models_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'artworkId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'modelId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'artwork_models_fk_0',
          columns: ['artworkId'],
          referenceTable: 'artwork',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'artwork_models_fk_1',
          columns: ['modelId'],
          referenceTable: 'model',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'artwork_models_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'artworkmodels_index_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'artworkId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'modelId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'artwork_tags',
      dartName: 'ArtworkTags',
      schema: 'public',
      module: 'spectra',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'artwork_tags_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'artworkId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'tagId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'artwork_tags_fk_0',
          columns: ['artworkId'],
          referenceTable: 'artwork',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'artwork_tags_fk_1',
          columns: ['tagId'],
          referenceTable: 'tag',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'artwork_tags_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'artworktags_index_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'artworkId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'tagId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'artwork_views',
      dartName: 'ArtworkViews',
      schema: 'public',
      module: 'spectra',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'artwork_views_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'artworkId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'viewedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'dateCreated',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'artwork_views_fk_0',
          columns: ['artworkId'],
          referenceTable: 'artwork',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'artwork_views_fk_1',
          columns: ['viewedById'],
          referenceTable: 'user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'artwork_views_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'artwork_views_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'artworkId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'viewedById',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'follower',
      dartName: 'Follower',
      schema: 'public',
      module: 'spectra',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'follower_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'followerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'followingId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'followedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'follower_fk_0',
          columns: ['followerId'],
          referenceTable: 'user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'follower_fk_1',
          columns: ['followingId'],
          referenceTable: 'user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'follower_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'follower_unique_index',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'followerId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'followingId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'model',
      dartName: 'Model',
      schema: 'public',
      module: 'spectra',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'model_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'usageCount',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
          columnDefault: '1',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'model_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'tag',
      dartName: 'Tag',
      schema: 'public',
      module: 'spectra',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'tag_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'usageCount',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
          columnDefault: '1',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'tag_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'user',
      dartName: 'User',
      schema: 'public',
      module: 'spectra',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'user_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'email',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'username',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'bio',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
          columnDefault: '\'Hello there, welcome to my profile!\'::text',
        ),
        _i2.ColumnDefinition(
          name: 'profileImageUrl',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'website',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'location',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'followersCount',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
          columnDefault: '0',
        ),
        _i2.ColumnDefinition(
          name: 'followingCount',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
          columnDefault: '0',
        ),
        _i2.ColumnDefinition(
          name: 'artworksCount',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
          columnDefault: '0',
        ),
        _i2.ColumnDefinition(
          name: 'likesCount',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
          columnDefault: '0',
        ),
        _i2.ColumnDefinition(
          name: 'interests',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<String>?',
        ),
        _i2.ColumnDefinition(
          name: 'likedArtworks',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<int>?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'user_fk_0',
          columns: ['userId'],
          referenceTable: 'serverpod_user_info',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'user_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    ..._i3.Protocol.targetTableDefinitions,
    ..._i2.Protocol.targetTableDefinitions,
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i4.Artwork) {
      return _i4.Artwork.fromJson(data) as T;
    }
    if (t == _i5.ArtworkComment) {
      return _i5.ArtworkComment.fromJson(data) as T;
    }
    if (t == _i6.ArtworkCommentLikes) {
      return _i6.ArtworkCommentLikes.fromJson(data) as T;
    }
    if (t == _i7.ArtworkCommentList) {
      return _i7.ArtworkCommentList.fromJson(data) as T;
    }
    if (t == _i8.ArtworkCommentUpdates) {
      return _i8.ArtworkCommentUpdates.fromJson(data) as T;
    }
    if (t == _i9.ArtworkCommentWithUserState) {
      return _i9.ArtworkCommentWithUserState.fromJson(data) as T;
    }
    if (t == _i10.ArtworkData) {
      return _i10.ArtworkData.fromJson(data) as T;
    }
    if (t == _i11.ArtworkDownloads) {
      return _i11.ArtworkDownloads.fromJson(data) as T;
    }
    if (t == _i12.ArtworkList) {
      return _i12.ArtworkList.fromJson(data) as T;
    }
    if (t == _i13.ArtworkModels) {
      return _i13.ArtworkModels.fromJson(data) as T;
    }
    if (t == _i14.ArtworkTags) {
      return _i14.ArtworkTags.fromJson(data) as T;
    }
    if (t == _i15.ArtworkUpdates) {
      return _i15.ArtworkUpdates.fromJson(data) as T;
    }
    if (t == _i16.ArtworkViews) {
      return _i16.ArtworkViews.fromJson(data) as T;
    }
    if (t == _i17.ArtworkWithUserState) {
      return _i17.ArtworkWithUserState.fromJson(data) as T;
    }
    if (t == _i18.ArtworkLikes) {
      return _i18.ArtworkLikes.fromJson(data) as T;
    }
    if (t == _i19.CommentType) {
      return _i19.CommentType.fromJson(data) as T;
    }
    if (t == _i20.ServerSideException) {
      return _i20.ServerSideException.fromJson(data) as T;
    }
    if (t == _i21.ArtworkFilter) {
      return _i21.ArtworkFilter.fromJson(data) as T;
    }
    if (t == _i22.Follower) {
      return _i22.Follower.fromJson(data) as T;
    }
    if (t == _i23.MediaType) {
      return _i23.MediaType.fromJson(data) as T;
    }
    if (t == _i24.Model) {
      return _i24.Model.fromJson(data) as T;
    }
    if (t == _i25.ModelsList) {
      return _i25.ModelsList.fromJson(data) as T;
    }
    if (t == _i26.PresignedUrlRequest) {
      return _i26.PresignedUrlRequest.fromJson(data) as T;
    }
    if (t == _i27.PresignedUrlResponse) {
      return _i27.PresignedUrlResponse.fromJson(data) as T;
    }
    if (t == _i28.SearchVectorResponse) {
      return _i28.SearchVectorResponse.fromJson(data) as T;
    }
    if (t == _i29.Tag) {
      return _i29.Tag.fromJson(data) as T;
    }
    if (t == _i30.TagsList) {
      return _i30.TagsList.fromJson(data) as T;
    }
    if (t == _i31.User) {
      return _i31.User.fromJson(data) as T;
    }
    if (t == _i32.UserWithState) {
      return _i32.UserWithState.fromJson(data) as T;
    }
    if (t == _i1.getType<_i4.Artwork?>()) {
      return (data != null ? _i4.Artwork.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.ArtworkComment?>()) {
      return (data != null ? _i5.ArtworkComment.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.ArtworkCommentLikes?>()) {
      return (data != null ? _i6.ArtworkCommentLikes.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i7.ArtworkCommentList?>()) {
      return (data != null ? _i7.ArtworkCommentList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.ArtworkCommentUpdates?>()) {
      return (data != null ? _i8.ArtworkCommentUpdates.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i9.ArtworkCommentWithUserState?>()) {
      return (data != null
          ? _i9.ArtworkCommentWithUserState.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i10.ArtworkData?>()) {
      return (data != null ? _i10.ArtworkData.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.ArtworkDownloads?>()) {
      return (data != null ? _i11.ArtworkDownloads.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.ArtworkList?>()) {
      return (data != null ? _i12.ArtworkList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.ArtworkModels?>()) {
      return (data != null ? _i13.ArtworkModels.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.ArtworkTags?>()) {
      return (data != null ? _i14.ArtworkTags.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.ArtworkUpdates?>()) {
      return (data != null ? _i15.ArtworkUpdates.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.ArtworkViews?>()) {
      return (data != null ? _i16.ArtworkViews.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.ArtworkWithUserState?>()) {
      return (data != null ? _i17.ArtworkWithUserState.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i18.ArtworkLikes?>()) {
      return (data != null ? _i18.ArtworkLikes.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.CommentType?>()) {
      return (data != null ? _i19.CommentType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.ServerSideException?>()) {
      return (data != null ? _i20.ServerSideException.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i21.ArtworkFilter?>()) {
      return (data != null ? _i21.ArtworkFilter.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.Follower?>()) {
      return (data != null ? _i22.Follower.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.MediaType?>()) {
      return (data != null ? _i23.MediaType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.Model?>()) {
      return (data != null ? _i24.Model.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i25.ModelsList?>()) {
      return (data != null ? _i25.ModelsList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.PresignedUrlRequest?>()) {
      return (data != null ? _i26.PresignedUrlRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i27.PresignedUrlResponse?>()) {
      return (data != null ? _i27.PresignedUrlResponse.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i28.SearchVectorResponse?>()) {
      return (data != null ? _i28.SearchVectorResponse.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i29.Tag?>()) {
      return (data != null ? _i29.Tag.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i30.TagsList?>()) {
      return (data != null ? _i30.TagsList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i31.User?>()) {
      return (data != null ? _i31.User.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i32.UserWithState?>()) {
      return (data != null ? _i32.UserWithState.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i14.ArtworkTags>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i14.ArtworkTags>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i13.ArtworkModels>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i13.ArtworkModels>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i31.User>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i31.User>(e)).toList()
          : null) as T;
    }
    if (t == List<_i9.ArtworkCommentWithUserState>) {
      return (data as List)
          .map((e) => deserialize<_i9.ArtworkCommentWithUserState>(e))
          .toList() as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i26.PresignedUrlRequest>) {
      return (data as List)
          .map((e) => deserialize<_i26.PresignedUrlRequest>(e))
          .toList() as T;
    }
    if (t == _i1.getType<List<_i27.PresignedUrlResponse>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i27.PresignedUrlResponse>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i27.PresignedUrlResponse>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i27.PresignedUrlResponse>(e))
              .toList()
          : null) as T;
    }
    if (t == List<_i17.ArtworkWithUserState>) {
      return (data as List)
          .map((e) => deserialize<_i17.ArtworkWithUserState>(e))
          .toList() as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i13.ArtworkModels>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i13.ArtworkModels>(e))
              .toList()
          : null) as T;
    }
    if (t == List<_i24.Model>) {
      return (data as List).map((e) => deserialize<_i24.Model>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i14.ArtworkTags>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i14.ArtworkTags>(e)).toList()
          : null) as T;
    }
    if (t == List<_i29.Tag>) {
      return (data as List).map((e) => deserialize<_i29.Tag>(e)).toList() as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i33.PresignedUrlResponse>) {
      return (data as List)
          .map((e) => deserialize<_i33.PresignedUrlResponse>(e))
          .toList() as T;
    }
    if (t == List<_i34.PresignedUrlRequest>) {
      return (data as List)
          .map((e) => deserialize<_i34.PresignedUrlRequest>(e))
          .toList() as T;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i4.Artwork) {
      return 'Artwork';
    }
    if (data is _i5.ArtworkComment) {
      return 'ArtworkComment';
    }
    if (data is _i6.ArtworkCommentLikes) {
      return 'ArtworkCommentLikes';
    }
    if (data is _i7.ArtworkCommentList) {
      return 'ArtworkCommentList';
    }
    if (data is _i8.ArtworkCommentUpdates) {
      return 'ArtworkCommentUpdates';
    }
    if (data is _i9.ArtworkCommentWithUserState) {
      return 'ArtworkCommentWithUserState';
    }
    if (data is _i10.ArtworkData) {
      return 'ArtworkData';
    }
    if (data is _i11.ArtworkDownloads) {
      return 'ArtworkDownloads';
    }
    if (data is _i12.ArtworkList) {
      return 'ArtworkList';
    }
    if (data is _i13.ArtworkModels) {
      return 'ArtworkModels';
    }
    if (data is _i14.ArtworkTags) {
      return 'ArtworkTags';
    }
    if (data is _i15.ArtworkUpdates) {
      return 'ArtworkUpdates';
    }
    if (data is _i16.ArtworkViews) {
      return 'ArtworkViews';
    }
    if (data is _i17.ArtworkWithUserState) {
      return 'ArtworkWithUserState';
    }
    if (data is _i18.ArtworkLikes) {
      return 'ArtworkLikes';
    }
    if (data is _i19.CommentType) {
      return 'CommentType';
    }
    if (data is _i20.ServerSideException) {
      return 'ServerSideException';
    }
    if (data is _i21.ArtworkFilter) {
      return 'ArtworkFilter';
    }
    if (data is _i22.Follower) {
      return 'Follower';
    }
    if (data is _i23.MediaType) {
      return 'MediaType';
    }
    if (data is _i24.Model) {
      return 'Model';
    }
    if (data is _i25.ModelsList) {
      return 'ModelsList';
    }
    if (data is _i26.PresignedUrlRequest) {
      return 'PresignedUrlRequest';
    }
    if (data is _i27.PresignedUrlResponse) {
      return 'PresignedUrlResponse';
    }
    if (data is _i28.SearchVectorResponse) {
      return 'SearchVectorResponse';
    }
    if (data is _i29.Tag) {
      return 'Tag';
    }
    if (data is _i30.TagsList) {
      return 'TagsList';
    }
    if (data is _i31.User) {
      return 'User';
    }
    if (data is _i32.UserWithState) {
      return 'UserWithState';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Artwork') {
      return deserialize<_i4.Artwork>(data['data']);
    }
    if (dataClassName == 'ArtworkComment') {
      return deserialize<_i5.ArtworkComment>(data['data']);
    }
    if (dataClassName == 'ArtworkCommentLikes') {
      return deserialize<_i6.ArtworkCommentLikes>(data['data']);
    }
    if (dataClassName == 'ArtworkCommentList') {
      return deserialize<_i7.ArtworkCommentList>(data['data']);
    }
    if (dataClassName == 'ArtworkCommentUpdates') {
      return deserialize<_i8.ArtworkCommentUpdates>(data['data']);
    }
    if (dataClassName == 'ArtworkCommentWithUserState') {
      return deserialize<_i9.ArtworkCommentWithUserState>(data['data']);
    }
    if (dataClassName == 'ArtworkData') {
      return deserialize<_i10.ArtworkData>(data['data']);
    }
    if (dataClassName == 'ArtworkDownloads') {
      return deserialize<_i11.ArtworkDownloads>(data['data']);
    }
    if (dataClassName == 'ArtworkList') {
      return deserialize<_i12.ArtworkList>(data['data']);
    }
    if (dataClassName == 'ArtworkModels') {
      return deserialize<_i13.ArtworkModels>(data['data']);
    }
    if (dataClassName == 'ArtworkTags') {
      return deserialize<_i14.ArtworkTags>(data['data']);
    }
    if (dataClassName == 'ArtworkUpdates') {
      return deserialize<_i15.ArtworkUpdates>(data['data']);
    }
    if (dataClassName == 'ArtworkViews') {
      return deserialize<_i16.ArtworkViews>(data['data']);
    }
    if (dataClassName == 'ArtworkWithUserState') {
      return deserialize<_i17.ArtworkWithUserState>(data['data']);
    }
    if (dataClassName == 'ArtworkLikes') {
      return deserialize<_i18.ArtworkLikes>(data['data']);
    }
    if (dataClassName == 'CommentType') {
      return deserialize<_i19.CommentType>(data['data']);
    }
    if (dataClassName == 'ServerSideException') {
      return deserialize<_i20.ServerSideException>(data['data']);
    }
    if (dataClassName == 'ArtworkFilter') {
      return deserialize<_i21.ArtworkFilter>(data['data']);
    }
    if (dataClassName == 'Follower') {
      return deserialize<_i22.Follower>(data['data']);
    }
    if (dataClassName == 'MediaType') {
      return deserialize<_i23.MediaType>(data['data']);
    }
    if (dataClassName == 'Model') {
      return deserialize<_i24.Model>(data['data']);
    }
    if (dataClassName == 'ModelsList') {
      return deserialize<_i25.ModelsList>(data['data']);
    }
    if (dataClassName == 'PresignedUrlRequest') {
      return deserialize<_i26.PresignedUrlRequest>(data['data']);
    }
    if (dataClassName == 'PresignedUrlResponse') {
      return deserialize<_i27.PresignedUrlResponse>(data['data']);
    }
    if (dataClassName == 'SearchVectorResponse') {
      return deserialize<_i28.SearchVectorResponse>(data['data']);
    }
    if (dataClassName == 'Tag') {
      return deserialize<_i29.Tag>(data['data']);
    }
    if (dataClassName == 'TagsList') {
      return deserialize<_i30.TagsList>(data['data']);
    }
    if (dataClassName == 'User') {
      return deserialize<_i31.User>(data['data']);
    }
    if (dataClassName == 'UserWithState') {
      return deserialize<_i32.UserWithState>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i3.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i4.Artwork:
        return _i4.Artwork.t;
      case _i5.ArtworkComment:
        return _i5.ArtworkComment.t;
      case _i6.ArtworkCommentLikes:
        return _i6.ArtworkCommentLikes.t;
      case _i11.ArtworkDownloads:
        return _i11.ArtworkDownloads.t;
      case _i13.ArtworkModels:
        return _i13.ArtworkModels.t;
      case _i14.ArtworkTags:
        return _i14.ArtworkTags.t;
      case _i16.ArtworkViews:
        return _i16.ArtworkViews.t;
      case _i18.ArtworkLikes:
        return _i18.ArtworkLikes.t;
      case _i22.Follower:
        return _i22.Follower.t;
      case _i24.Model:
        return _i24.Model.t;
      case _i29.Tag:
        return _i29.Tag.t;
      case _i31.User:
        return _i31.User.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'spectra';
}
