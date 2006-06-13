/*
 
 Permission is hereby granted, free of charge, to any person obtaining a 
 copy of this software and associated documentation files (the "Software"), 
 to deal in the Software without restriction, including without limitation 
 the rights to use, copy, modify, merge, publish, distribute, sublicense, 
 and/or sell copies of the Software, and to permit persons to whom the Software 
 is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in 
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS 
 FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR 
 COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
 AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION 
 WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 Please send fixes to
	<ghulands@framedphotographics.com>
	<ben@scriptsoftware.com>
 
 */

#import "NSProcessInfo+iMedia.h"
#include <stdio.h>
#include <sys/param.h>
#include <sys/sysctl.h>

@implementation NSProcessInfo (iMedia)

// from http://www.cocoabuilder.com/archive/message/cocoa/2001/8/7/49091

+ (int)numberOfProcessors
{
	int mib[2];
	size_t len;
	int maxproc = 1;
	
	mib[0] = CTL_HW;
	mib[1] = HW_NCPU;
	len = sizeof(maxproc);
	if (sysctl(mib, 2, &maxproc, &len, NULL, 0) == -1) {
		perror("could not determine number of cpus available");
	}
	
	return maxproc;
}

@end