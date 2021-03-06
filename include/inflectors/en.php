<?php
// +-----------------------------------------------------------------------+
// | Piwigo - a PHP based photo gallery                                    |
// +-----------------------------------------------------------------------+
// | Copyright(C) 2008-2014 Piwigo Team                  http://piwigo.org |
// | Copyright(C) 2003-2008 PhpWebGallery Team    http://phpwebgallery.net |
// | Copyright(C) 2002-2003 Pierrick LE GALL   http://le-gall.net/pierrick |
// +-----------------------------------------------------------------------+
// | This program is free software; you can redistribute it and/or modify  |
// | it under the terms of the GNU General Public License as published by  |
// | the Free Software Foundation                                          |
// |                                                                       |
// | This program is distributed in the hope that it will be useful, but   |
// | WITHOUT ANY WARRANTY; without even the implied warranty of            |
// | MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU      |
// | General Public License for more details.                              |
// |                                                                       |
// | You should have received a copy of the GNU General Public License     |
// | along with this program; if not, write to the Free Software           |
// | Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, |
// | USA.                                                                  |
// +-----------------------------------------------------------------------+

class Inflector_en
{
  private $exceptions;
  private $pluralizers;
  private $singularizers;

  function __construct()
  {
    $tmp = 	array ('octopus' => 'octopuses',
      'virus' => 'viruses',
      'person' => 'people',
      'man' => 'men',
      'woman' => 'women',
      'child' => 'children',
      'move' => 'moves',
      'mouse' => 'mice',
      'ox' => 'oxen',
      'zombie' => 'zombies',
    );

    $this->exceptions = $tmp;
    foreach ($tmp as $k => $v)
      $this->exceptions[$v] = $k;

    foreach ( explode(' ', 'new news advice art coal baggage butter clothing cotton currency deer energy equipment experience fish flour food furniture gas homework impatience information jeans knowledge leather love luggage money oil patience police polish progress research rice series sheep silk soap species sugar talent toothpaste travel vinegar weather wood wool work')
      as $v)
    {
      $this->exceptions[$v] = 0;
    }

    $this->pluralizers = array_reverse(array( '/$/' => 's',
      '/s$/' => 's',
      '/^(ax|test)is$/' => '\1es',
      '/(alias|status)$/' => '\1es',
      '/(bu)s$/' => '\1ses',
      '/(buffal|tomat)o$/' => '\1oes',
      '/([ti])um$/' => '\1a',
      '/([ti])a$/' => '\1a',
      '/sis$/' => 'ses',
      '/(?:([^f])fe|([lr])f)$/' => '\1\2ves',
      '/(hive)$/' => '\1s',
      '/([^aeiouy]|qu)y$/' => '\1ies',
      '/(x|ch|ss|sh)$/' => '\1es',
      '/(matr|vert|ind)(?:ix|ex)$/' => '\1ices',
      '/(quiz)$/' => '\1zes',
      ));

    $this->singularizers = array_reverse(array(
      '/s$/' => '',
      '/(ss)$/' => '\1',
      '/(n)ews$/' => '\1ews',
      '/([ti])a$/' => '\1um',
      '/((a)naly|(b)a|(d)iagno|(p)arenthe|(p)rogno|(s)ynop|(t)he)(sis|ses)$/' => '\1sis',
      '/(^analy)(sis|ses)$/' => '\1sis',
      '/([^f])ves$/' => '\1fe',
      '/(hive)s$/' => '\1',
      '/(tive)s$/' => '\1',
      '/([lr])ves$/' => '\1f',
      '/([^aeiouy]|qu)ies$/' => '\1y',
      '/(s)eries$/' => '\1eries',
      '/(m)ovies$/' => '\1ovie',
      '/(x|ch|ss|sh)es$/' => '\1',
      '/(bus)(es)?$/' => '\1',
      '/(o)es$/' => '\1',
      '/(shoe)s$/' => '\1',
      '/(cris|test)(is|es)$/' => '\1is',
      '/^(a)x[ie]s$/' => '\1xis',
      '/(alias|status)(es)?$/' => '\1',
      '/(vert|ind)ices$/' => '\1ex',
      '/(matr)ices$/' => '\1ix',
      '/(quiz)zes$/' => '\1',
      '/(database)s$/' => '\1',
      ));
  }

  function get_variants($word)
  {
    $res = array();

    $word = strtolower($word);

    $rc = @$this->exceptions[$word];
    if ( isset($rc) )
    {
      if (!empty($rc))
        $res[] = $rc;
      return $res;
    }

    foreach ($this->pluralizers as $rule => $replacement)
    {
      $rc = preg_replace($rule, $replacement, $word, -1, $count);
      if ($count)
      {
        $res[] = $rc;
        break;
      }
    }

    foreach ($this->singularizers as $rule => $replacement)
    {
      $rc = preg_replace($rule, $replacement, $word, -1, $count);
      if ($count)
      {
        $res[] = $rc;
        break;
      }
    }

    return $res;
  }
}
?>