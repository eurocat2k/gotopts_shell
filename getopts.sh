usage() {
    echo
    echo "  Usage of $(basename $0) [-hv] [-a <article>] [-l [lang]]"
    echo 
    echo "    where"
    echo "          -h - this help"
    echo "          -v - turn on verbose output" 
    echo "          -a <articale> - the article text (shall be escaped if multiple words given)"
    echo "          -l - define language (use default either skip this option or do not specify any language after the option)"
    echo
    exit 1
}
if [ $# -eq 0 ]
then
    usage
    exit 1
fi
ARTICLE=
VERBOSE=0
LANG=C
while getopts ':a:l:vh' opt; do
    case $opt in
        (h)   usage;;
        (v)   VERBOSE=$(expr $VERBOSE + 1);;
        (a)   ARTICLE=$OPTARG;;
        (l)   LANG=$OPTARG;;
        (:)   # "optional arguments" (missing option-argument handling)
            case $OPTARG in
                (a) 
                    echo ""
                    echo "    Error: required argument - see help (-h)"
                    echo ""
                    exit 1
                    ;; # error, according to our syntax
                (l) :
                    ;;      # acceptable but does nothing
            esac;;
        (*) 
            echo ""
            echo "    Error:Invalid arguments detected"
            usage
            ;;
    esac
done
shift "$OPTIND"

echo "ARTICLE=$ARTICLE"
echo "VERBOSE=$(echo $VERBOSE)"
echo "LANG=$LANG"
