${SegmentFile}

!define ASSOCSTR_EXECUTABLE 2
!define ASSOCF_NOTRUNCATE 0x00000020
!define ASSOCF_REMAPRUNDLL 0x00000080
!define ASSOCF_NOFIXUPS 0x00000100

${SegmentInit}
  System::Call 'SHLWAPI::AssocQueryString(i ${ASSOCF_NOTRUNCATE}|${ASSOCF_REMAPRUNDLL}|${ASSOCF_NOFIXUPS}, i ${ASSOCSTR_EXECUTABLE}, t "http", t "open", t.r1, *i ${NSIS_MAX_STRLEN})i.r0'
  ${IfNot} $1 == $EXEDIR\$EXEFILE
    StrCpy $0 $EXEDIR\App\AppInfo\appinfo.ini
    
    ReadINIStr $1 $0 Details Name
    ReadINIStr $2 $0 Details AppId
    ReadINIStr $3 $0 Details Publisher
    ReadINIStr $4 $0 Details Description
    
    ${If} ${Cmd} 'MessageBox MB_YESNO "Set $1 as default browser?" IDYES'
      WriteRegStr HKCU SOFTWARE\RegisteredApplications $2 SOFTWARE\Clients\StartMenuInternet\$2\Capabilities
      
      WriteRegStr HKCU SOFTWARE\Clients\StartMenuInternet\$2 "" $1
      WriteRegStr HKCU SOFTWARE\Clients\StartMenuInternet\$2\Capabilities ApplicationDescription $4
      WriteRegStr HKCU SOFTWARE\Clients\StartMenuInternet\$2\Capabilities ApplicationIcon $EXEDIR\$EXEFILE,0
      WriteRegStr HKCU SOFTWARE\Clients\StartMenuInternet\$2\Capabilities ApplicationName $1
      WriteRegStr HKCU SOFTWARE\Clients\StartMenuInternet\$2\Capabilities\FileAssociations .htm $2HTM
      WriteRegStr HKCU SOFTWARE\Clients\StartMenuInternet\$2\Capabilities\FileAssociations .html $2HTM
      WriteRegStr HKCU SOFTWARE\Clients\StartMenuInternet\$2\Capabilities\FileAssociations .mht $2HTM
      WriteRegStr HKCU SOFTWARE\Clients\StartMenuInternet\$2\Capabilities\FileAssociations .mhtml $2HTM
      WriteRegStr HKCU SOFTWARE\Clients\StartMenuInternet\$2\Capabilities\FileAssociations .pdf $2HTM
      WriteRegStr HKCU SOFTWARE\Clients\StartMenuInternet\$2\Capabilities\FileAssociations .shtml $2HTM
      WriteRegStr HKCU SOFTWARE\Clients\StartMenuInternet\$2\Capabilities\FileAssociations .svg $2HTM
      WriteRegStr HKCU SOFTWARE\Clients\StartMenuInternet\$2\Capabilities\FileAssociations .webp $2HTM
      WriteRegStr HKCU SOFTWARE\Clients\StartMenuInternet\$2\Capabilities\FileAssociations .xht $2HTM
      WriteRegStr HKCU SOFTWARE\Clients\StartMenuInternet\$2\Capabilities\FileAssociations .xhtml $2HTM
      WriteRegStr HKCU SOFTWARE\Clients\StartMenuInternet\$2\Capabilities\FileAssociations .xml $2HTM
      WriteRegStr HKCU SOFTWARE\Clients\StartMenuInternet\$2\Capabilities\Startmenu StartMenuInternet $2
      WriteRegStr HKCU SOFTWARE\Clients\StartMenuInternet\$2\Capabilities\URLAssociations ftp $2HTM
      WriteRegStr HKCU SOFTWARE\Clients\StartMenuInternet\$2\Capabilities\URLAssociations http $2HTM
      WriteRegStr HKCU SOFTWARE\Clients\StartMenuInternet\$2\Capabilities\URLAssociations https $2HTM
      WriteRegStr HKCU SOFTWARE\Clients\StartMenuInternet\$2\Capabilities\URLAssociations irc $2HTM
      WriteRegStr HKCU SOFTWARE\Clients\StartMenuInternet\$2\Capabilities\URLAssociations mailto $2HTM
      WriteRegStr HKCU SOFTWARE\Clients\StartMenuInternet\$2\Capabilities\URLAssociations microsoft-edge $2HTM
      WriteRegStr HKCU SOFTWARE\Clients\StartMenuInternet\$2\Capabilities\URLAssociations microsoft-edge-holographic $2HTM
      WriteRegStr HKCU SOFTWARE\Clients\StartMenuInternet\$2\Capabilities\URLAssociations mms $2HTM
      WriteRegStr HKCU SOFTWARE\Clients\StartMenuInternet\$2\Capabilities\URLAssociations news $2HTM
      WriteRegStr HKCU SOFTWARE\Clients\StartMenuInternet\$2\Capabilities\URLAssociations nntp $2HTM
      WriteRegStr HKCU SOFTWARE\Clients\StartMenuInternet\$2\Capabilities\URLAssociations sms $2HTM
      WriteRegStr HKCU SOFTWARE\Clients\StartMenuInternet\$2\Capabilities\URLAssociations smsto $2HTM
      WriteRegStr HKCU SOFTWARE\Clients\StartMenuInternet\$2\Capabilities\URLAssociations snews $2HTM
      WriteRegStr HKCU SOFTWARE\Clients\StartMenuInternet\$2\Capabilities\URLAssociations tel $2HTM
      WriteRegStr HKCU SOFTWARE\Clients\StartMenuInternet\$2\Capabilities\URLAssociations urn $2HTM
      WriteRegStr HKCU SOFTWARE\Clients\StartMenuInternet\$2\Capabilities\URLAssociations webcal $2HTM
      WriteRegStr HKCU SOFTWARE\Clients\StartMenuInternet\$2\DefaultIcon "" $EXEDIR\$EXEFILE,0
      WriteRegStr HKCU SOFTWARE\Clients\StartMenuInternet\$2\shell\open\command "" '"$EXEDIR\$EXEFILE"'
      
      WriteRegStr HKCU SOFTWARE\Classes\$2HTM "" "$1 HTML Document"
      WriteRegStr HKCU SOFTWARE\Classes\$2HTM AppUserModelId $2
      WriteRegStr HKCU SOFTWARE\Classes\$2HTM\Application AppUserModelId $2
      WriteRegStr HKCU SOFTWARE\Classes\$2HTM\Application ApplicationIcon $EXEDIR\$EXEFILE,0
      WriteRegStr HKCU SOFTWARE\Classes\$2HTM\Application ApplicationName $1
      WriteRegStr HKCU SOFTWARE\Classes\$2HTM\Application ApplicationDescription $4
      WriteRegStr HKCU SOFTWARE\Classes\$2HTM\Application ApplicationCompany $3
      WriteRegStr HKCU SOFTWARE\Classes\$2HTM\DefaultIcon "" $EXEDIR\$EXEFILE,0
      WriteRegStr HKCU SOFTWARE\Classes\$2HTM\shell\open\command "" '"$EXEDIR\$EXEFILE" "%1"'
    ${EndIf}
  ${EndIf}
!macroend
