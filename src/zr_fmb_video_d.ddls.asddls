@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Query View for Draft Table ZFMB_VIDEO_D'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_FMB_VIDEO_D as select from zfmb_video_d
{
    key videouuid as Videouuid,
    title as Title,
    url as Url,
    description as Description,
    active as Active,
    localcreatedby as Localcreatedby,
    localcreatedat as Localcreatedat,
    locallastchangedby as Locallastchangedby,
    locallastchangedat as Locallastchangedat,
    lastchangedat as Lastchangedat,
    draftentitycreationdatetime as Draftentitycreationdatetime,
    draftentitylastchangedatetime as Draftentitylastchangedatetime,
    draftadministrativedatauuid as Draftadministrativedatauuid,
    draftentityoperationcode as Draftentityoperationcode,
    hasactiveentity as Hasactiveentity,
    draftfieldchanges as Draftfieldchanges
}
