function strerror -a number -d "Print the error message corresponding to an error code or number"
    if [ -z $number ]
        for errno in (seq 1 121)
            echo $errno (strerror $errno)
        end
        return 0
    end

    switch "$number"
        case 1 EPERM
            echo 'Not owner'
        case 2 ENOENT
            echo 'No such file or directory'
        case 3 ESRCH
            echo 'No such process'
        case 4 EINTR
            echo 'Interrupted system call'
        case 5 EIO
            echo 'I/O error'
        case 6 ENXIO
            echo 'No such device or address'
        case 7 E2BIG
            echo 'Arg list too long'
        case 8 ENOEXEC
            echo 'Exec format error'
        case 9 EBADF
            echo 'Bad file number'
        case 10 ECHILD
            echo 'No child processes'
        case 11 EWOULDBLOCK
            echo 'Operation would block'
        case 12 EAGAIN
            echo 'No more processes'
        case 13 ENOMEM
            echo 'Not enough space'
        case 14 EACCES
            echo 'Permission denied'
        case 15 EFAULT
            echo 'Bad address'
        case 16 ENOTBLK
            echo 'Block device required'
        case 17 EBUSY
            echo 'Device busy'
        case 18 EEXIST
            echo 'File exists'
        case 19 EXDEV
            echo 'Cross-device link'
        case 20 ENODEV
            echo 'No such device'
        case 21 ENOTDIR
            echo 'Not a directory'
        case 22 EISDIR
            echo 'Is a directory'
        case 23 EINVAL
            echo 'Invalid argument'
        case 24 ENFILE
            echo 'File table overflow'
        case 25 EMFILE
            echo 'Too many open files'
        case 26 ENOTTY
            echo 'Not a typewriter'
        case 27 ETXTBSY
            echo 'Text file busy'
        case 28 EFBIG
            echo 'File too large'
        case 29 ENOSPC
            echo 'No space left on device'
        case 30 ESPIPE
            echo 'Illegal seek'
        case 31 EROFS
            echo 'Read-only file system'
        case 32 EMLINK
            echo 'Too many links'
        case 33 EPIPE
            echo 'Broken pipe'
        case 34 EDOM
            echo 'Math argument out of domain of func'
        case 35 ERANGE
            echo 'Math result not representable'
        case 36 ENOMSG
            echo 'No message of desired type'
        case 37 EIDRM
            echo 'Identifier removed'
        case 38 ECHRNG
            echo 'Channel number out of range'
        case 39 EL2NSYNC
            echo 'Level 2 not synchronized'
        case 40 EL3HLT
            echo 'Level 3 halted'
        case 41 EL3RST
            echo 'Level 3 reset'
        case 42 ELNRNG
            echo 'Link number out of range'
        case 43 EUNATCH
            echo 'Protocol driver not attached'
        case 44 ENOCSI
            echo 'No CSI structure available'
        case 45 EL2HLT
            echo 'Level 2 halted'
        case 46 EDEADLK
            echo 'Deadlock condition'
        case 47 ENOLCK
            echo 'No record locks available'
        case 48 EBADE
            echo 'Invalid exchange'
        case 49 EBADR
            echo 'Invalid request descriptor'
        case 50 EXFULL
            echo 'Exchange full'
        case 51 ENOANO
            echo 'No anode'
        case 52 EBADRQC
            echo 'Invalid request code'
        case 53 EBADSLT
            echo 'Invalid slot'
        case 54 EDEADLOCK
            echo 'File locking deadlock error'
        case 55 EBFONT
            echo 'Bad font file format'
        case 56 ENOSTR
            echo 'Device not a stream'
        case 57 ENODATA
            echo 'No data available'
        case 58 ETIME
            echo 'Timer expired'
        case 59 ENOSR
            echo 'Out of streams resources'
        case 60 ENONET
            echo 'Machine is not on the network'
        case 61 ENOPKG
            echo 'Package not installed'
        case 62 EREMOTE
            echo 'Object is remote'
        case 63 ENOLINK
            echo 'Link has been severed'
        case 64 EADV
            echo 'Advertise error'
        case 65 ESRMNT
            echo 'Srmount error'
        case 66 ECOMM
            echo 'Communication error on send'
        case 67 EPROTO
            echo 'Protocol error'
        case 68 EMULTIHOP
            echo 'Multihop attempted'
        case 69 EDOTDOT
            echo 'RFS specific error'
        case 70 EBADMSG
            echo 'Not a data message'
        case 71 ENAMETOOLONG
            echo 'File name too long'
        case 72 EOVERFLOW
            echo 'Value too large for defined data type'
        case 73 ENOTUNIQ
            echo 'Name not unique on network'
        case 74 EBADFD
            echo 'File descriptor in bad state'
        case 75 EREMCHG
            echo 'Remote address changed'
        case 76 ELIBACC
            echo 'Can not access a needed shared library'
        case 77 ELIBBAD
            echo 'Accessing a corrupted shared library'
        case 78 ELIBSCN
            echo 'lib section in a.out corrupted'
        case 79 ELIBMAX
            echo 'Attempting to link in too many shared libraries'
        case 80 ELIBEXEC
            echo 'Cannot exec a shared library directly'
        case 81 EILSEQ
            echo 'Illegal byte sequence'
        case 82 ENOSYS
            echo 'Operation not applicable'
        case 83 ELOOP
            echo 'Too many symbolic links encountered'
        case 84 ERESTART
            echo 'Interrupted system call should be restarted'
        case 85 ESTRPIPE
            echo 'Streams pipe error'
        case 86 ENOTEMPTY
            echo 'Directory not empty'
        case 87 EUSERS
            echo 'Too many users'
        case 88 ENOTSOCK
            echo 'Socket operation on non-socket'
        case 89 EDESTADDRREQ
            echo 'Destination address required'
        case 90 EMSGSIZE
            echo 'Message too long'
        case 91 EPROTOTYPE
            echo 'Protocol wrong type for socket'
        case 92 ENOPROTOOPT
            echo 'Protocol not available'
        case 93 EPROTONOSUPPORT
            echo 'Protocol not supported'
        case 94 ESOCKTNOSUPPORT
            echo 'Socket type not supported'
        case 95 EOPNOTSUPP
            echo 'Operation not supported on transport endpoint'
        case 96 EPFNOSUPPORT
            echo 'Protocol family not supported'
        case 97 EAFNOSUPPORT
            echo 'Address family not supported by protocol'
        case 98 EADDRINUSE
            echo 'Address already in use'
        case 99 EADDRNOTAVAIL
            echo 'assign requested address'
        case 100 ENETDOWN
            echo 'Network is down'
        case 101 ENETUNREACH
            echo 'Network is unreachable'
        case 102 ENETRESET
            echo 'Network dropped connection because of reset'
        case 103 ECONNABORTED
            echo 'Software caused connection abort'
        case 104 ECONNRESET
            echo 'Connection reset by peer'
        case 105 ENOBUFS
            echo 'No buffer space available'
        case 106 EISCONN
            echo 'Transport endpoint is already connected'
        case 107 ENOTCONN
            echo 'Transport endpoint is not connected'
        case 108 ESHUTDOWN
            echo 'Cannot send after transport endpoint shutdown'
        case 109 ETOOMANYREFS
            echo 'Too many references: cannot splice'
        case 110 ETIMEDOUT
            echo 'Connection timed out'
        case 111 ECONNREFUSED
            echo 'Connection refused'
        case 112 EHOSTDOWN
            echo 'Host is down'
        case 113 EHOSTUNREACH
            echo 'No route to host'
        case 114 EALREADY
            echo 'Operation already in progress'
        case 115 EINPROGRESS
            echo 'Operation now in progress'
        case 116 ESTALE
            echo 'Stale NFS file handle'
        case 117 EUCLEAN
            echo 'Structure needs cleaning'
        case 118 ENOTNAM
            echo 'Not a XENIX named type file'
        case 119 ENAVAIL
            echo 'No XENIX semaphores available'
        case 120 EISNAM
            echo 'Is a named type file'
        case 121 EREMOTEIO
            echo 'Remote I/O error'
        case 0
        case '*'
            echo 'Error code out of range!'
            return (errno EINVAL)
    end

    return 0
end
