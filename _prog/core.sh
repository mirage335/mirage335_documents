##### Core


_unite_with_bookmarks_procedure() {
	[[ ! -e "$currentPersonReadable_toc" ]] && [[ -e "$currentPersonReadable_toc_script" ]] && "$currentPersonReadable_toc_script"
	
	local currentArg
	
	rm -f "$scriptAbsoluteFolder"/document_pdfmarks_tmp.txt > /dev/null 2>&1
	[[ -e "$currentPersonReadable_toc" ]] && rm -f "$currentPersonReadable_toc"
	
	_safeEcho '"' >> "$currentPersonReadable_toc"
	
	local currentBookPage
	currentBookPage=1
	local currentFilePage
	currentFilePage=0
	local currentFileName
	local currentIteration
	currentIteration=0
	while [[ "$1" != "" ]] && [[ "$2" != "" ]] && [[ -e "$1" ]]
	do
		currentArg=""
		currentArg="$1"
		currentArg2="1"
		currentArg2="$2"
		shift
		shift
		
		currentFileName=$(basename "$currentArg")
		#currentFileName=$(_safeEcho_newline "$currentFileName" | sed 's/^[0-9][0-9][0-9]\-//g')
		currentFileName=$(_safeEcho_newline "$currentFileName" | sed 's/\.pdf$//g' | sed 's/\.sh$//g' )
		
		if [[ "$currentArg2" != "0" ]]
		then
			echo 'BookmarkBegin
BookmarkTitle: '$currentFileName'
BookmarkLevel: '"$currentArg2"'
BookmarkPageNumber: '"$currentBookPage" >> "$scriptAbsoluteFolder"/document_pdfmarks_tmp.txt
			
			_safeEcho "$currentBookPage"'			' >> "$currentPersonReadable_toc"
			currentIteration=0
			for currentIteration in $(seq 1 "$currentArg2")
			do
				_safeEcho '	' >> "$currentPersonReadable_toc"
			done
			_safeEcho_newline "$currentFileName" >> "$currentPersonReadable_toc"
			
			_messagePlain_nominal 'table of contents: '"$currentFileName"
			_messagePlain_probe_var currentFilePage
			_messagePlain_probe_var currentBookPage
		fi
		
		currentFilePage=$(pdftk "$currentArg" dump_data 2>/dev/null | grep NumberOfPages | tr -dc '0-9')
		[[ "$currentFilePage" == "" ]] && currentFilePage=0
		let currentBookPage="$currentBookPage"'+'"$currentFilePage"
	done
	
	_safeEcho_newline '"' >> "$currentPersonReadable_toc"
	_safeEcho_newline '' >> "$currentPersonReadable_toc"
	[[ -e "$currentPersonReadable_toc_script" ]] && "$currentPersonReadable_toc_script"
}

_unite_with_bookmarks() {
	_messageNormal ' consolidate_documents: _unite_with_bookmarks: table of contents'
	_unite_with_bookmarks_procedure "$@"
	
	#_messageNormal ' consolidate_documents: _unite_with_bookmarks: table of contents (round01,02)'
	#_unite_with_bookmarks_procedure "$@"
	
	#_messageNormal ' consolidate_documents: _unite_with_bookmarks: table of contents (round02,02)'
	#_unite_with_bookmarks_procedure "$@"
	
	
	
	local currentArg
	local ignoreArg
	ignoreArg="false"
	for currentArg in "$@"
	do
		if [[ "$ignoreArg" == "false" ]]
		then
			processedArgs+=("$currentArg")
			ignoreArg="true"
		else
			ignoreArg="false"
		fi
	done
	
	_messageNormal ' consolidate_documents: _unite_with_bookmarks: pdfunite'
	rm -f "$scriptAbsoluteFolder"/document_tmp.pdf > /dev/null 2>&1
	pdfunite "${processedArgs[@]}" "$scriptAbsoluteFolder"/document_tmp.pdf
	
	_messageNormal ' consolidate_documents: _unite_with_bookmarks: pdftk'
	pdftk "$scriptAbsoluteFolder"/document_tmp.pdf cat output - | \
	pdftk - update_info "$scriptAbsoluteFolder"/document_pdfmarks_tmp.txt output "$scriptAbsoluteFolder"/document_tmp.pdf.tmp
	
	
	mv "$scriptAbsoluteFolder"/document_tmp.pdf.tmp "$scriptAbsoluteFolder"/document_tmp.pdf
	rm -f "$scriptAbsoluteFolder"/document_pdfmarks_tmp.txt
}





_consolidate_documents() {
	export currentPersonReadable_toc_script=
	export currentPersonReadable_toc_script="$scriptAbsoluteFolder"/zzLib_800-documents/799-automatic/799-tableOfContents.sh
	export currentPersonReadable_toc="$scriptAbsoluteFolder"/zzLib_800-documents/799-automatic/_lib/tableOfContents.txt
	_unite_with_bookmarks "$scriptAbsoluteFolder"/zzLib_800-documents/050-sorting/200-preface/200-preface.sh.pdf "0" \
	"$scriptAbsoluteFolder"/zzLib_800-documents/799-automatic/799-tableOfContents.sh.pdf "0" \
	"$scriptAbsoluteFolder"/zzLib_800-documents/050-sorting/100-draft/001-documentName/001-documentName.sh.pdf "1" \
	"$scriptAbsoluteFolder"/zzLib_800-documents/050-sorting/100-draft/001-documentName/001-documentName-errata.sh.pdf "2" \
	
	
	mv "$scriptAbsoluteFolder"/document_tmp.pdf "$scriptAbsoluteFolder"/document.pdf > /dev/null 2>&1
	
	
	echo _____
	sleep 20
}













_refresh_anchors() {
	cp -a "$scriptAbsoluteFolder"/_anchor.bat "$scriptAbsoluteFolder"/_consolidate_documents.bat
}






