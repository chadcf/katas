// Find the longest substring in a given string which consts of only 2 characters
// Attempt at a recursive solution. Not crazy about it, nested if, too many params
// passed to helper function. I think this one might be better suited to doing
// with a loop.
object substring {
  
  def substring(input: String): String = {
    def substring_inner(chars: List[Char], sub: List[Char], matches: List[Char], best: List[Char]): List[Char] = {
      chars match {
        case Nil => best
        case x::xs => {
          if ( matches.contains(x) || matches.distinct.length < 2 ) {
            if ( matches.length + 1 > best.length ) substring_inner(xs, sub, matches :+ x, matches :+ x)
            else substring_inner(xs, sub, matches :+ x, best)
          }
          else substring_inner(sub.tail, sub.tail, List[Char](), best)
        }
      }
    }
    substring_inner(input.toList, input.toList, List[Char](), List[Char]()).mkString
  }
  
  substring("abbccc")
  substring("abcabcabcabccc")
  substring("qwertyytrewq")


}