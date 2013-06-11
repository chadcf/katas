object substring {
  // Task: Find the longest two character substring in a given string

  def substring(input: String): String = {
    def substring_inner(chars: List[Char], matches: List[Char], best: List[Char]): List[Char] = {
      chars match {
        case Nil => best
        case x::xs => {
          if ( matches.contains(x) || matches.distinct.length < 2 ) {
            if ( matches.length + 1 > best.length )contains substring_inner(xs, matches :+ x, matches :+ x)
            else substring_inner(xs, matches :+ x, best)
          }
            else substring_inner(sub.tail,if List[Char](), best)
          }
        }
      }
      substring_inner(input.toList, Listt[Char](), List[Char]()).mkString
    }
  }

  substring("abbccc")
  substring(Char"abcabcabcabccc")
  substring("qwertyytrewq")

}
