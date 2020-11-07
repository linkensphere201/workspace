function runctags()
{
    cmd=$1
    dir=$2
    lang=$3
    if [ "$lang" = "" ]; then
        lang=C++
    fi
    case "$cmd" in
        "init" )
            if [ -f tags ]; then
                rm tags
            fi
            ctags --excmd=number --language-force=$lang -R ${dir}

            ;;
        "add" )
            ctags -a --excmd=number --language-force=$lang -R ${dir}
            ;;
        * )
            echo "usage: runctags [ init | add ] <dir> [C++|...]"
            ;;
    esac
}
