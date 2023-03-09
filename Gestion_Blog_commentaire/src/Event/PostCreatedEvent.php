<?php

/*
 * This file is part of the Symfony package.
 *
 * (c) Fabien Potencier <fabien@symfony.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace App\Event;

use App\Entity\Comment;
use App\Entity\Post;
use Symfony\Contracts\EventDispatcher\Event;

class PostCreatedEvent extends Event
{
    public function __construct(
        protected Post $post
    ) {
    }

    public function getPost(): Post
    {
        return $this->post;
    }
}
