
set names 'utf8';

-- Post
CREATE TABLE `post` (     
  `id` int(11) PRIMARY KEY AUTO_INCREMENT, -- Unique ID
  `title` text NOT NULL,      -- Title  
  `content` text NOT NULL,    -- Text 
  `status` int(11) NOT NULL,  -- Status  
  `date_created` datetime NOT NULL -- Creation date    
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='utf8_general_ci';

-- Comment
CREATE TABLE `comment` (     
  `id` int(11) PRIMARY KEY AUTO_INCREMENT, -- Unique ID  
  `post_id` int(11) NOT NULL,     -- Post ID this comment belongs to  
  `content` text NOT NULL,        -- Text
  `author` varchar(128) NOT NULL, -- Author's name who created the comment  
  `date_created` datetime NOT NULL -- Creation date          
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='utf8_general_ci';

-- Tag
CREATE TABLE `tag` (     
  `id` int(11) PRIMARY KEY AUTO_INCREMENT, -- Unique ID.  
  `name` VARCHAR(128) NOT NULL,            -- Tag name.  
  UNIQUE KEY `name_key` (`name`)          -- Tag names must be unique.      
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='utf8_general_ci';

-- Post-Tag
CREATE TABLE `post_tag` (     
  `id` int(11) PRIMARY KEY AUTO_INCREMENT, -- Unique ID  
  `post_id` int(11),                       -- Post id
  `tag_id` int(11),                        -- Tag id
   UNIQUE KEY `unique_key` (`post_id`, `tag_id`), -- Tag names must be unique.
   KEY `post_id_key` (`post_id`),
   KEY `tag_id_key` (`tag_id`)      
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='utf8_general_ci';

INSERT INTO tag(`name`) VALUES('ZF3');
INSERT INTO tag(`name`) VALUES('book');
INSERT INTO tag(`name`) VALUES('magento');
INSERT INTO tag(`name`) VALUES('bootstrap');

INSERT INTO post(`title`, `content`, `status`, `date_created`) VALUES(
   'Blog Test',
   'Blog Test', 
   2, '2016-08-09 18:49');

INSERT INTO post(`title`, `content`, `status`, `date_created`) VALUES(
   'Magento',
   'Magento - site', 
   2, '2016-08-10 18:51');

INSERT INTO post(`title`, `content`, `status`, `date_created`) VALUES(
   'Twitter Bootstrap',
   'Twitter Bootstrap.', 
   2, '2016-08-11 13:01');

INSERT INTO post_tag(`post_id`, `tag_id`) VALUES(1, 1);
INSERT INTO post_tag(`post_id`, `tag_id`) VALUES(1, 2);
INSERT INTO post_tag(`post_id`, `tag_id`) VALUES(2, 2);
INSERT INTO post_tag(`post_id`, `tag_id`) VALUES(2, 3);
INSERT INTO post_tag(`post_id`, `tag_id`) VALUES(3, 4);

INSERT INTO comment(`post_id`, `content`, `author`, `date_created`) VALUES(
    1, 'Excellent post!', 'Austin', '2020-08-09 19:20');