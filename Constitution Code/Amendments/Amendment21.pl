*/ Section 1 repealed amendment 18 */

*/Section 2 */
prohibited(transportation(intoxicatingLiquors, unitedStates)) :- violation(law).
prohibited(importation(intoxicatingLiquors, unitedStates)) :- violation(law).
prohibited(use(intoxicatingLiquors, unitedStates)) :- violation(law).

*/ Section 3 */
operative(thisArticle) :- 
   ratified(amendment(constitution), threeFourth(states), withinYears(7)).
