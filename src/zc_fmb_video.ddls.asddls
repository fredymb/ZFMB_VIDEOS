@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
define root view entity ZC_FMB_VIDEO
  provider contract transactional_query
  as projection on ZR_FMB_VIDEO
{
  key     VideoUuid,
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_FMB_VIDEO_VIRTUAL_ELEMENTS'
          @EndUserText.label: 'Thumbnail'
          @Semantics.imageUrl: true
  virtual Thumbnail : abap.char(256),
          Title,
          Url,
          Description,
          Active,
          LocalCreatedBy,
          LocalCreatedAt,
          LocalLastChangedBy,
          LocalLastChangedAt,
          LastChangedAt

}
