// native word .doing (doing)
/*
 *  in CREATE'd words that have been DOES>'d this is an alias
 * to docol. That is, wforth treats the word as if it had been
 * created through ':' and calls (doing1) as a result.
 *
 * +--------+
 * |.doing  |
 * +--------+
 * |(doing1)|
 * +--------+
 * |offset  |
 * +--------+
 * |...     |
 * +--------+
 */
.doing:
    j .docol
