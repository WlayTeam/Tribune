#========文章标题表=========================================
DROP TABLE
IF EXISTS title;

CREATE TABLE
IF NOT EXISTS title (
    tid INT PRIMARY KEY NOT NULL,
    title VARCHAR (50) NOT NULL
)

#========文章详情表=========================================
DROP TABLE
IF EXISTS summary;

CREATE TABLE
IF NOT EXISTS summary (
    sid INT PRIMARY KEY NOT NULL,
    content VARCHAR (255) NOT NULL,
    author VARCHAR (10) NOT NULL,
    utime DATE NOT NULL,
    summary_tid INT NOT NULL,
    FOREIGN KEY (summary_tid) REFERENCES title (tid)
)
