using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

namespace Lixr.Util.editor.tinymce.plugins.validatetext.Editor {
    /// <summary>
    /// 
    /// </summary>
    /// <remarks></remarks>
    /// <example></example>
    public class Lixr : ILixr {
        /* *******************************************************************
         *  Properties 
         * *******************************************************************/
        #region public int Index
        /// <summary>
        /// Get/Sets the Index of the Lixr
        /// </summary>
        /// <value></value>
        public int Index { get; set; }
        #endregion
        /* *******************************************************************
         * Constructors
         * *******************************************************************/
        #region public Lixr()
        /// <summary>
        /// Initializes a new instance of the <b>Lixr</b> class.
        /// </summary>
        public Lixr() { }
        #endregion
        #region public Lixr(string input)
        /// <summary>
        /// Initializes a new instance of the <b>Lixr</b> class.
        /// </summary>
        /// <param name="input"></param>
        public Lixr(string input) {
            decimal O = WordCount(input);
            decimal M = SentencesCount(input);
            decimal L = LongWordCount(input);
            decimal Lm = (O / M);
            decimal Lo = ((L * 100) / O);
            Index = Decimal.ToInt32(Math.Round(Lm + Lo));
        }
        #endregion
        /* *******************************************************************
         * Methods
         * *******************************************************************/
        #region private int WordCount(string input)
        /// <summary>
        /// 
        /// </summary>
        /// <param name="input"></param>
        /// <returns></returns>
        private static int WordCount(string input) {
            if (string.IsNullOrEmpty(input))
                return 0;
            MatchCollection collection = Regex.Matches(input, @"[\S]+");
            return collection.Count;
        }
        #endregion
        #region private int SentencesCount(string input)

        /// <summary>
        /// 
        /// </summary>
        /// <param name="input"></param>
        /// <returns></returns>
        private static int SentencesCount(string input) {
            if (string.IsNullOrEmpty(input))
                return 0;
            return input.Split(new[] { '.' }, StringSplitOptions.RemoveEmptyEntries).Length;
        }
        #endregion
        #region private int LongWordCount(string input)
        /// <summary>
        /// 
        /// </summary>
        /// <param name="input"></param>
        /// <returns></returns>
        private static int LongWordCount(string input) {
            if (string.IsNullOrEmpty(input))
                return 0;
            var delims = new[] { ' ', '.', ',', ';' };
            var wordlist = input.Split(delims, StringSplitOptions.RemoveEmptyEntries);
            var longWords = wordlist.Where(s => s.Length > 6).ToList();
            return longWords.Count;
        }
        #endregion
    }
}