#Enable search if "vm.img" and related files are missing.
export ubVirtImageLocal="false"

export ub_anchor_autoupgrade="true"

#export ub_anchor_specificSoftwareName="experimental"
#export ub_anchor_user="true"




_recompress_pdf() {
	# https://stackoverflow.com/questions/48411255/how-to-modify-jpeg-compression-in-pdf-files-using-ghostscript
	gs  -dNOPAUSE -dQUIET -dBATCH  -sDEVICE=pdfwrite -dPDFSETTINGS=/printer -dUseFlateCompression=true -sOutputFile="$1".tmp -c "<< /GrayImageDict << /Blend 1 /VSamples [2 1 1 2] /QFactor 1.0 /HSamples [2 1 1 2] >> /ColorACSImageDict << /Blend 1 /VSamples [2 1 1 2] /QFactor 1.0 /HSamples [2 1 1 2] >> >> setdistillerparams " -f "$1"
	mv -f "$1".tmp "$1"
}
_recompress_pdf-lowQuality() {
	# https://stackoverflow.com/questions/48411255/how-to-modify-jpeg-compression-in-pdf-files-using-ghostscript
	gs  -dNOPAUSE -dQUIET -dBATCH  -sDEVICE=pdfwrite -dPDFSETTINGS=/ebook -dUseFlateCompression=true -sOutputFile="$1".tmp -c "<< /GrayImageDict << /Blend 1 /VSamples [2 1 1 2] /QFactor 1.0 /HSamples [2 1 1 2] >> /ColorACSImageDict << /Blend 1 /VSamples [2 1 1 2] /QFactor 1.0 /HSamples [2 1 1 2] >> >> setdistillerparams " -f "$1"
	mv -f "$1".tmp "$1"
}






_consolidate_documents() {
	_start
	
	mkdir -p "$scriptAbsoluteFolder"/_bundle
	
	
	"$scriptAbsoluteFolder"/README.sh
	
	"$scriptLib"/universalTechnologySpecificationTextbook/ubiquitous_bash.sh _consolidate_documents
	
	
	
	ln -s "$scriptLib"/universalTechnologySpecificationTextbook/README.pdf "$safeTmp"/uTST-README.pdf
	
	ln -s "$scriptLib"/universalTechnologySpecificationTextbook/zzLib_800-documents/050-sorting/200-preface/200-preface.sh.pdf "$safeTmp"/uTST-200-preface.sh.pdf
	ln -s "$scriptLib"/universalTechnologySpecificationTextbook/zzLib_800-documents/050-sorting/200-preface/200-preface-errata.sh.pdf "$safeTmp"/uTST-200-preface-errata.sh.pdf
	#ln -s "$scriptLib"/universalTechnologySpecificationTextbook/zzLib_800-documents/799-automatic/799-tableOfContents.sh.pdf "$safeTmp"/uTST-799-tableOfContents.sh.pdf
	ln -s "$scriptLib"/universalTechnologySpecificationTextbook/zzLib_800-documents/050-sorting/100-draft/100-problemSolversGuide/100-problemSolversGuide.sh.pdf "$safeTmp"/uTST-100-problemSolversGuide.sh.pdf
	ln -s "$scriptLib"/universalTechnologySpecificationTextbook/zzLib_800-documents/050-sorting/100-draft/100-problemSolversGuide/100-problemSolversGuide-errata.sh.pdf "$safeTmp"/uTST-100-problemSolversGuide-errata.sh.pdf
	ln -s "$scriptLib"/universalTechnologySpecificationTextbook/zzLib_800-documents/050-sorting/100-draft/170-cognitionSplicer/170-cognitionSplicer.sh.pdf "$safeTmp"/uTST-170-cognitionSplicer.sh.pdf
	ln -s "$scriptLib"/universalTechnologySpecificationTextbook/zzLib_800-documents/050-sorting/100-draft/170-cognitionSplicer/170-cognitionSplicer-errata.sh.pdf "$safeTmp"/uTST-170-cognitionSplicer-errata.sh.pdf
	ln -s "$scriptLib"/universalTechnologySpecificationTextbook/zzLib_800-documents/050-sorting/100-draft/140-neuralBits/140-neuralBits.sh.pdf "$safeTmp"/uTST-140-neuralBits.sh.pdf
	ln -s "$scriptLib"/universalTechnologySpecificationTextbook/zzLib_800-documents/050-sorting/100-draft/140-neuralBits/140-neuralBits-errata.sh.pdf "$safeTmp"/uTST-140-neuralBits-errata.sh.pdf
	ln -s "$scriptLib"/universalTechnologySpecificationTextbook/zzLib_800-documents/050-sorting/100-draft/155-mechDive/155-mechDive.sh.pdf "$safeTmp"/uTST-155-mechDive.sh.pdf
	ln -s "$scriptLib"/universalTechnologySpecificationTextbook/zzLib_800-documents/050-sorting/100-draft/155-mechDive/155-mechDive-errata.sh.pdf "$safeTmp"/uTST-155-mechDive-errata.sh.pdf
	ln -s "$scriptLib"/universalTechnologySpecificationTextbook/zzLib_800-documents/050-sorting/100-draft/190-CARDinal/190-CARDinal.sh.pdf "$safeTmp"/uTST-190-CARDinal.sh.pdf
	ln -s "$scriptLib"/universalTechnologySpecificationTextbook/zzLib_800-documents/050-sorting/100-draft/190-CARDinal/190-CARDinal-errata.sh.pdf "$safeTmp"/uTST-190-CARDinal-errata.sh.pdf
	ln -s "$scriptLib"/universalTechnologySpecificationTextbook/zzLib_800-documents/050-sorting/100-draft/195-lithoDive/195-lithoDive.sh.pdf "$safeTmp"/uTST-195-lithoDive.sh.pdf
	ln -s "$scriptLib"/universalTechnologySpecificationTextbook/zzLib_800-documents/050-sorting/100-draft/195-lithoDive/195-lithoDive-errata.sh.pdf "$safeTmp"/uTST-195-lithoDive-errata.sh.pdf
	ln -s "$scriptLib"/universalTechnologySpecificationTextbook/zzLib_800-documents/050-sorting/100-draft/150-positionTrackers/150-positionTrackers.sh.pdf "$safeTmp"/uTST-150-positionTrackers.sh.pdf
	ln -s "$scriptLib"/universalTechnologySpecificationTextbook/zzLib_800-documents/050-sorting/100-draft/175-sleeveDive/175-sleeveDive.sh.pdf "$safeTmp"/uTST-175-sleeveDive.sh.pdf
	ln -s "$scriptLib"/universalTechnologySpecificationTextbook/zzLib_800-documents/050-sorting/100-draft/175-sleeveDive/175-sleeveDive-errata.sh.pdf "$safeTmp"/uTST-175-sleeveDive-errata.sh.pdf
	ln -s "$scriptLib"/universalTechnologySpecificationTextbook/zzLib_800-documents/050-sorting/100-draft/199-cryogenicComputer/199-cryogenicComputer.sh.pdf "$safeTmp"/uTST-199-cryogenicComputer.sh.pdf
	ln -s "$scriptLib"/universalTechnologySpecificationTextbook/zzLib_800-documents/050-sorting/100-draft/199-cryogenicComputer/199-cryogenicComputer-errata.sh.pdf "$safeTmp"/uTST-199-cryogenicComputer-errata.sh.pdf
	ln -s "$scriptLib"/universalTechnologySpecificationTextbook/zzLib_800-documents/050-sorting/100-draft/199-flightDeck/199-flightDeck.pdf "$safeTmp"/uTST-199-flightDeck.pdf
	ln -s "$scriptLib"/universalTechnologySpecificationTextbook/zzLib_800-documents/050-sorting/100-draft/199-toys/199-toys.pdf "$safeTmp"/uTST-199-toys.pdf
	ln -s "$scriptLib"/universalTechnologySpecificationTextbook/zzLib_800-documents/050-sorting/100-draft/180-modularAI/180-modularAI.pdf "$safeTmp"/uTST-180-modularAI.pdf
	ln -s "$scriptLib"/universalTechnologySpecificationTextbook/zzLib_800-documents/050-sorting/100-draft/181-motivation/181-motivation.pdf "$safeTmp"/uTST-181-motivation.pdf
	ln -s "$scriptLib"/universalTechnologySpecificationTextbook/zzLib_800-documents/050-sorting/100-draft/181-motivation/181-motivation-errata.sh.pdf "$safeTmp"/uTST-181-motivation-errata.sh.pdf
	ln -s "$scriptLib"/universalTechnologySpecificationTextbook/zzLib_800-documents/050-sorting/100-draft/185-memoryRegeneration/185-memoryRegeneration.sh.pdf "$safeTmp"/uTST-185-memoryRegeneration.sh.pdf
	ln -s "$scriptLib"/universalTechnologySpecificationTextbook/zzLib_800-documents/050-sorting/100-draft/185-memoryRegeneration/185-memoryRegeneration-errata.sh.pdf "$safeTmp"/uTST-185-memoryRegeneration-errata.sh.pdf
	ln -s "$scriptLib"/universalTechnologySpecificationTextbook/zzLib_800-documents/050-sorting/201-copyright/201-copyright.sh.pdf "$safeTmp"/uTST-201-copyright.sh.pdf
	
	ln -s "$scriptLib"/ubiquitous_bash/README.pdf "$safeTmp"/ubiquitous_bash-README.pdf
	
	ln -s "$scriptLib"/CoreAutoSSH/_doc/netDoc/netDoc.pdf "$safeTmp"/netDoc.sh.pdf
	
	
	ln -s "$scriptLib"/extendedInterface/commonControlScheme.pdf "$safeTmp"/extendedInterface-commonControlScheme.sh.pdf
	ln -s "$scriptLib"/extendedInterface/referenceImplementations.pdf "$safeTmp"/extendedInterface-referenceImplementations.sh.pdf
	#ln -s "$scriptLib"/extendedInterface/sequence.pdf "$safeTmp"/extendedInterface-sequence.sh.pdf
	
	ln -s "$scriptLib"/mirage335_author/document-numbering.pdf "$safeTmp"/design-numbering.sh.pdf
	
	ln -s "$scriptLib"/PatchRap/PatchRap.pdf "$safeTmp"/PatchRap.sh.pdf
	
	# Although very useful, may be omitted as long as any possible copyright conflict (ie. CC-BY-SA 3.0 and AGPLv3) exists.
	#ln -s "$scriptLib"/from_Wikipedia/orig/Operational_amplifier_applications.pdf "$safeTmp"/OpAmp_Apps_Wikipedia.sh.pdf
	
	ln -s "$scriptLib"/mirage335_author/document-biography.pdf "$safeTmp"/mirage335-biography.sh.pdf
	ln -s "$scriptLib"/mirage335_author/document-recruiting-complete.pdf "$safeTmp"/mirage335-recruiting.sh.pdf
	
	#"$safeTmp"/extendedInterface-sequence.sh.pdf "1" \
	#"$safeTmp"/OpAmp_Apps_Wikipedia.sh.pdf "1" \
	#"$safeTmp"/uTST-799-tableOfContents.sh.pdf "0" \
	export currentPersonReadable_toc_script=
	export currentPersonReadable_toc_script="$scriptAbsoluteFolder"/zzLib_800-documents/799-automatic/799-tableOfContents.sh
	export currentPersonReadable_toc="$scriptAbsoluteFolder"/zzLib_800-documents/799-automatic/_lib/tableOfContents.txt
	_unite_with_bookmarks "$safeTmp"/uTST-README.pdf "1" \
	"$scriptAbsoluteFolder"/zzLib_800-documents/799-automatic/799-tableOfContents.sh.pdf "0" \
	"$safeTmp"/uTST-200-preface.sh.pdf "1" \
	"$safeTmp"/uTST-200-preface-errata.sh.pdf "0" \
	"$safeTmp"/uTST-100-problemSolversGuide.sh.pdf "1" \
	"$safeTmp"/uTST-100-problemSolversGuide-errata.sh.pdf "2" \
	"$safeTmp"/uTST-170-cognitionSplicer.sh.pdf "1" \
	"$safeTmp"/uTST-170-cognitionSplicer-errata.sh.pdf "2" \
	"$safeTmp"/uTST-140-neuralBits.sh.pdf "1" \
	"$safeTmp"/uTST-140-neuralBits-errata.sh.pdf "2" \
	"$safeTmp"/uTST-155-mechDive.sh.pdf "1" \
	"$safeTmp"/uTST-155-mechDive-errata.sh.pdf "2" \
	"$safeTmp"/uTST-190-CARDinal.sh.pdf "1" \
	"$safeTmp"/uTST-190-CARDinal-errata.sh.pdf "2" \
	"$safeTmp"/uTST-195-lithoDive.sh.pdf "1" \
	"$safeTmp"/uTST-195-lithoDive-errata.sh.pdf "2" \
	"$safeTmp"/uTST-150-positionTrackers.sh.pdf "1" \
	"$safeTmp"/uTST-175-sleeveDive.sh.pdf "1" \
	"$safeTmp"/uTST-175-sleeveDive-errata.sh.pdf "2" \
	"$safeTmp"/uTST-199-cryogenicComputer.sh.pdf "1" \
	"$safeTmp"/uTST-199-cryogenicComputer-errata.sh.pdf "2" \
	"$safeTmp"/uTST-199-flightDeck.pdf "1" \
	"$safeTmp"/uTST-199-toys.pdf "1" \
	"$safeTmp"/uTST-180-modularAI.pdf "1" \
	"$safeTmp"/uTST-181-motivation.pdf "1" \
	"$safeTmp"/uTST-181-motivation-errata.sh.pdf "2" \
	"$safeTmp"/uTST-185-memoryRegeneration.sh.pdf "1" \
	"$safeTmp"/uTST-185-memoryRegeneration-errata.sh.pdf "2" \
	"$safeTmp"/uTST-201-copyright.sh.pdf "1" \
	"$safeTmp"/ubiquitous_bash-README.pdf "1" \
	"$safeTmp"/netDoc.sh.pdf "1" \
	"$safeTmp"/extendedInterface-commonControlScheme.sh.pdf "1" \
	"$safeTmp"/extendedInterface-referenceImplementations.sh.pdf "1" \
	"$safeTmp"/design-numbering.sh.pdf "1" \
	"$safeTmp"/PatchRap.sh.pdf "1" \
	"$safeTmp"/mirage335-recruiting.sh.pdf "1" \
	"$safeTmp"/mirage335-biography.sh.pdf "1" \
	
	
	
	
	
	#mv "$scriptAbsoluteFolder"/document_tmp.pdf "$scriptAbsoluteFolder"/document.pdf > /dev/null 2>&1
	#mv "$scriptAbsoluteFolder"/document_tmp.pdf "$scriptBundle"/document.pdf > /dev/null 2>&1
	mv "$scriptAbsoluteFolder"/document_tmp.pdf "$scriptBundle"/mirage335_documents.pdf > /dev/null 2>&1
	rm -f "$safeTmp"/*.pdf
	
	#cp "$scriptBundle"/document.pdf "$scriptBundle"/document_lowQuality.pdf
	#_recompress_pdf-lowQuality "$scriptBundle"/document_lowQuality.pdf
	
	echo _____
	sleep 20
	_stop
}


