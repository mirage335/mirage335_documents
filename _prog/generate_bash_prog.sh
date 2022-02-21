_generate_compile_bash_prog() {
	"$scriptAbsoluteLocation" _true
	
	#return
	
	rm "$scriptAbsoluteFolder"/ubiquitous_bash.sh
	
	#"$scriptAbsoluteLocation" _compile_bash cautossh cautossh
	#"$scriptAbsoluteLocation" _compile_bash lean lean.sh
	
	"$scriptAbsoluteLocation" _compile_bash consolidate ubiquitous_bash.sh
	
	#"$scriptAbsoluteLocation" _compile_bash "" ""
	#"$scriptAbsoluteLocation" _compile_bash ubiquitous_bash ubiquitous_bash.sh
	
	#"$scriptAbsoluteLocation" _package
}


# Temporarily disable. Backend 'qualculate' may suffice, and should preferably be called directly
_test_devgnuoctave() {
	true
}

# Temporarily partly disable. Should not urgently need 'gnuplot' .
_test_devqalculate() {
	_wantGetDep qalculate-gtk
	_wantGetDep qalculate
	
	_wantGetDep qalc
	
	##! _typeShare 'texmf/tex/latex/gnuplot/gnuplot.cfg' && _wantGetDep gnuplot-data
	##! _typeShare 'texmf/tex/latex/gnuplot/gnuplot.cfg' && echo 'warn: missing: gnuplot-data'
	
	#_wantGetDep gnuplot-data
	#_wantGetDep gnuplot-x11
	##_wantGetDep gnuplot-qt
	
	##_wantGetDep gnuplot
	
	! _typeDep qalculate-gtk && echo 'warn: missing: qalculate-gtk'
	
	return 0
}

# Temporarily disable.
_test_mktorrent() {
	true
}

