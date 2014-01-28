---
id: 647071965
link: http://odi.tumblr.com/post/647071965/erroneous-copyfrom-method-in-jcifs-vfs
slug: erroneous-copyfrom-method-in-jcifs-vfs
date: Sun May 30 2010 18:04:00 GMT+0200 (CEST)
publish: 2010-05-030
tags: Java, JCIFS, VFS
title: Erroneous copyFrom() method in JCIFS/VFS
---


At the [HSR (University of Applied Science
Rapperswil)](http://www.hsr.ch) we are currently developing a software
to synchronize files from the central fileserver to the students
computers. This should help the students to get the latest slides for
their lectures.

The software is based on [VFS (Virtual
Filesystem)](http://commons.apache.org/vfs/) from the [Apache Commons
project](http://commons.apache.org/). The file server is a classic Samba
server that uses the CIFS protocol, and with the use of VFS we ensured a
common access the the filesystem, no matter if it’s the remote
filesystem of the file server or the local filesystem on the student’s
computers.

At a point we got a very strange error: we could copy files from the
remote system, but when we delete the files while the application is
running, and try to copy the files again, the copy fails:

    FileSystemException "could not copy [source-path] to [target-path]".

We figured out, that the problem were the folders that don’t exist yet.
But according the the [documentation of the the copyFrom
method](http://commons.apache.org/vfs/apidocs/org/apache/commons/vfs/FileObject.html#copyFrom%28org.apache.commons.vfs.FileObject,%20org.apache.commons.vfs.FileSelector%29)
the parent folder should be created if it does not exist. This is also
the case when we do the first-time-copy, which works like a charm.

After serveral tries with refresh() etc. to bring the FileObjects and
the actual filesystem to sync, we finally implemented this workaround,
maybe somebody else can use it:

    protected void copyFile(FileObject targetFile, FileObject sourceFile) {
        try {
            FileObject parentFile = targetFile.getParent();
            parentFile.refresh();
            log.debug("Parent exists?: " + parentFile.exists());

            if (!parentFile.exists()) {
                parentFile.createFolder();
                log.debug(" => Folder created");
            }
            targetFile.copyFrom(sourceFile),new AllFileSelector());
        } catch (FileSystemException e) {
            log.warn("Could not copy file, FileSystemException: "
                    + e.getMessage());
        }
    }

(the above code is a little bit simplified, and the use of an extra
FileObject for the parent is not absolutely necessary, but it clarifies
the code)

In my opinion the copyFrom implementation of
[JCFIS](http://jcifs.samba.org/) (which is the Samba part of VFS) does
not work, i.e. this is a bug. But I’m not sure, maybe we overlook an
obvious thing on our side. Fact is, the above solution works for us. The
JCIFS is part of the VFS sandbox, this means the library is still in
development. Maybe I’ll file a bug, if I can clearly reproduce this
behavior.

