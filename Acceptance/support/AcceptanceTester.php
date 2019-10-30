<?php

/*
 *  (c) 2018 punkt.de GmbH - Karlsruhe, Germany - http://punkt.de
 *  All rights reserved.
 */

/**
 * Inherited Methods
 * @method void wantToTest($text)
 * @method void wantTo($text)
 * @method void execute($callable)
 * @method void expectTo($prediction)
 * @method void expect($prediction)
 * @method void amGoingTo($argumentation)
 * @method void am($role)
 * @method void lookForwardTo($achieveValue)
 * @method void comment($description)
 * @method \Codeception\Lib\Friend haveFriend($name, $actorClass = NULL)
 *
 * @SuppressWarnings(PHPMD)
*/
class AcceptanceTester extends \Codeception\Actor
{
    use _generated\AcceptanceTesterActions;
    use \PunktDe\Codeception\Webdriver\ActorTraits\Webdriver;
    use \PunktDe\Codeception\Cli\ActorTraits\Cli;
    use \PunktDe\Codeception\Filesystem\ActorTraits\Filesystem;
    use \PunktDe\Codeception\Mailhog\ActorTraits\Mailhog;
    use \PunktDe\Codeception\Database\ActorTraits\Database;
}
