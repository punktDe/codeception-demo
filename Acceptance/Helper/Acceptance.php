<?php
namespace Helper;

/*
 *  (c) 2018 punkt.de GmbH - Karlsruhe, Germany - http://punkt.de
 *  All rights reserved.
 */

use Codeception\Configuration;
use Codeception\Exception\ConfigurationException;
use Codeception\Exception\ModuleException;
use PunktDe\Codeception\Filesystem\Module\Filesystem;

class Acceptance extends \Codeception\Module
{
    /**
     * @param string[] $settings
     * @throws ConfigurationException
     * @throws ModuleException
     */
    public function _beforeSuite($settings = []): void
    {
        $filesystem = $this->getModule('\\'. Filesystem::class); /** @var Filesystem $filesystem */
        $filesystem->cleanDir(Configuration::outputDir());
    }
}
