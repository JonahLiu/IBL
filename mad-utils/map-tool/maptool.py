# Copyright (C) 2010 Texas Instruments Incorporated - http://www.ti.com/ 
# 
# 
#  Redistribution and use in source and binary forms, with or without 
#  modification, are permitted provided that the following conditions 
#  are met:
#
#    Redistributions of source code must retain the above copyright 
#    notice, this list of conditions and the following disclaimer.
#
#    Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the 
#    documentation and/or other materials provided with the   
#    distribution.
#
#    Neither the name of Texas Instruments Incorporated nor the names of
#    its contributors may be used to endorse or promote products derived
#    from this software without specific prior written permission.
#
#  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 
#  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT 
#  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
#  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT 
#  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
#  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT 
#  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
#  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
#  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT 
#  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
#  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

import os.path
import json
import re
import sys
import subprocess
import tempfile
import shutil
import struct

# change a hexadecimal string to decimal number and reverse
def dec2hex(n):
    """return the hexadecimal string representation of integer n"""
    return '0x' + "%X" % n

def hex2dec(s):
    """return the integer value of a hexadecimal string s"""
    return int(s, 16)

def align16(x):
    """Align the given number to 16 bytes"""
    return ((x + 15) & (~15))

# Returns a string with activation record in binary formart packed in network byte order
def genBinAr(opcode, arg1, arg2, arg3, arg4):
	__ar = (opcode, arg1, arg2, arg3, arg4)
	__s = struct.Struct('! I I I I I')
	return __s.pack(*__ar)
	
# Execute a program using the OS shell
def executeShellCmd(cmd,args):
	"""Returns status of executing cmd in a shell."""
	cmdLst = []
	__os = os.name
	if __os == 'posix':
		script = '#!/bin/sh' + '\n'
		script = script + cmd + ' ' + args + '\n'
		script_file = tempfile.NamedTemporaryFile('wt')
		script_file.write(script)
		script_file.flush()
		cmdLst.append('sh')
	elif __os == 'nt':
		script = '"' + cmd + '"' + ' ' + args + '\n'
		script_file = tempfile.NamedTemporaryFile('wt',suffix=".bat",delete=False)
		script_file.write(script)
		script_file.flush()
		script_file.close()
	cmdLst.append(script_file.name)
	try:
		retcode = subprocess.call(cmdLst)
		return retcode
	except OSError, e:
		print 'Execution failed:', e

# Execute a program from a given directory
def executeCmdInDir(dir, cmd, args):
	cmdLst = []
	__os = os.name
	if __os == 'posix':
		script = '#!/bin/sh' + '\n'
		script = script + 'cd ' + dir + '\n'
		script = script + cmd + ' ' + args + '\n'
		script_file = tempfile.NamedTemporaryFile('wt')
		script_file.write(script)
		script_file.flush()
		cmdLst.append('sh')
	elif __os == 'nt':
		#script = 'cd ' + dir + '\n'
		script = '"' + cmd + '"' + ' ' + args + '\n'
		script_file = tempfile.NamedTemporaryFile('wt', suffix=".bat",delete=False)
		script_file.write(script)
		script_file.flush()
		script_file.close()
	cmdLst.append(script_file.name)
	try:
		retcode = subprocess.call(cmdLst)
		return retcode
	except OSError, e:
		print 'Execution failed:', e

# copy file
def copyFile(src, dest):
	"""Copy src to dest"""
	shutil.copy2(src, dest)

def genPrelinkSegmentCmd(fileName, idx, addr):
	"""Generate the PreLinker SEGMENT Command"""
	cmd = '--segment_address='
	segId = '"' + fileName + '[' + idx + ']'
	cmd = cmd + segId + '=' + addr + '"'
	return cmd 	

def writeFile(fName, fContent):
	"""Write a text file, fContent is a python list of text lines"""
	__fd = open(fName, 'w')
	for line in fContent:
		__fd.write(line + '\n')
	__fd.close()

def writeFileBin(fName, fContent):
	"""Write a Binary file, fContent is a python list of lines"""
	__fd = open(fName, 'wb')
	for line in fContent:
		__fd.write(line)
	__fd.close()
	

def genFileHdr(fName, brief):
	"""Generate File header for a C File"""
	cmd = '/**' + '\n'
	cmd = cmd + ' * ' + 'file: ' + fName + '\n'
	cmd = cmd + ' * ' + '\n'
	cmd = cmd + ' * ' + 'brief: ' + '\n'
	cmd = cmd + ' * ' + '\t' + brief + '\n'
	cmd = cmd + ' * ' + '\n'
	cmd = cmd + ' */' + '\n'
	return cmd 

def genArFileMacros():
	"""Generate predefined Macros for the activation record C file"""
	opcode = 'MEMMAPSET'
	value = '0x1'
	cmd = '#define' + '\t' + opcode + '\t' + value + '\n'
	opcode = 'MEMATTRSET'
	value = '0x2'
	cmd = cmd + '#define' + '\t' + opcode + '\t' + value + '\n'
	opcode = 'MEMCPY'
	value = '0x3'
	cmd = cmd + '#define' + '\t' + opcode + '\t' + value + '\n'
	opcode = 'MEMSET'
	value = '0x4'
	cmd = cmd + '#define' + '\t' + opcode + '\t' + value + '\n'
	opcode = 'UX'
	value = '0x01'
	cmd = cmd + '#define' + '\t' + opcode + '\t' + value + '\n'
	opcode = 'UW'
	value = '0x02'
	cmd = cmd + '#define' + '\t' + opcode + '\t' + value + '\n'
	opcode = 'UR'
	value = '0x04'
	cmd = cmd + '#define' + '\t' + opcode + '\t' + value + '\n'
	opcode = 'SX'
	value = '0x08'
	cmd = cmd + '#define' + '\t' + opcode + '\t' + value + '\n'
	opcode = 'SW'
	value = '0x10'
	cmd = cmd + '#define' + '\t' + opcode + '\t' + value + '\n'
	opcode = 'SR'
	value = '0x20'
	cmd = cmd + '#define' + '\t' + opcode + '\t' + value + '\n'
	opcode = 'CACHE_EN'
	value = '0x01'
	cmd = cmd + '#define' + '\t' + opcode + '\t' + value + '\n'
	opcode = 'PREFETCH_EN'
	value = '0x02'
	cmd = cmd + '#define' + '\t' + opcode + '\t' + value + '\n'
	return cmd 
	
def genCommentLine(comment):
	"""Generate C comment"""
	cmd = '/* ' + comment + ' */' + '\n'
	return cmd 
	
def genSetMemMapArCmd(paddr, vaddr, size, attr):
	"""Generate the set memory map activation record Command opcode (MEMMAPSET)"""
	opcode = 'MEMMAPSET'
	comment = '/* Set Memory map */'
	cmd = '\t' + '{' + '\n'
	cmd = cmd + '\t\t' + opcode + ',' + '\t' + comment + '\n'
	cmd = cmd + '\t\t' + '(unsigned int)' + paddr + ',' + '\n'
	cmd = cmd + '\t\t' + '(unsigned int)' + vaddr + ',' + '\n'
	cmd = cmd + '\t\t' + '(unsigned int)' + size + ',' + '\n'
	cmd = cmd + '\t\t' + '(unsigned int)' + attr + '\n'
	cmd = cmd + '\t' + '}' + ',' + '\n'
	return cmd 
	
def genSetMemAttrArCmd(paddr, size, attr):
	"""Generate the set memory attribute activation record Command opcode (MEMATTRSET)"""
	opcode = 'MEMATTRSET'
	comment = '/* Set Memory Attributes */'
	cmd = '\t' + '{' + '\n'
	cmd = cmd + '\t\t' + opcode + ',' + '\t' + comment + '\n'
	cmd = cmd + '\t\t' + '(unsigned int)' + paddr + ',' + '\n'
	cmd = cmd + '\t\t' + '(unsigned int)' + size + ',' + '\n'
	cmd = cmd + '\t\t' + '(unsigned int)' + attr + ',' + '\n'
	cmd = cmd + '\t\t' + '(unsigned int)' + '0' + '\n'
	cmd = cmd + '\t' + '}' + ',' + '\n'
	return cmd 
	
def genMemCpyArCmd(dAddr, Saddr, nBytes):
	"""Generate the memory copy activation record Command opcode (MEMCPY)"""
	opcode = 'MEMCPY'
	comment = '/* Memory Copy */'
	cmd = '\t' + '{' + '\n'
	cmd = cmd + '\t\t' + opcode + ',' + '\t' + comment + '\n'
	cmd = cmd + '\t\t' + '(unsigned int)' + dAddr + ',' + '\n'
	cmd = cmd + '\t\t' + '(unsigned int)' + Saddr + ',' + '\n'
	cmd = cmd + '\t\t' + '(unsigned int)' + nBytes + ',' + '\n'
	cmd = cmd + '\t\t' + '(unsigned int)' + '0' + '\n'
	cmd = cmd + '\t' + '}' + ',' + '\n'
	return cmd 

def genMemSetArCmd(dAddr, char, nBytes):
	"""Generate the memory set activation record Command opcode (MEMSET)"""
	opcode = 'MEMSET'
	comment = '/* Memory Set */'
	cmd = '\t' + '{' + '\n'
	cmd = cmd + '\t\t' + opcode + ',' + '\t' + comment + '\n'
	cmd = cmd + '\t\t' + '(unsigned int)' + dAddr + ',' + '\n'
	cmd = cmd + '\t\t' + '(unsigned int)' + char + ',' + '\n'
	cmd = cmd + '\t\t' + '(unsigned int)' + nBytes + ',' + '\n'
	cmd = cmd + '\t\t' + '(unsigned int)' + '0' + '\n'
	cmd = cmd + '\t' + '}' + ',' + '\n'
	return cmd 

__memAttrDefines = {'CACHE_EN': 1, 'PREFETCH_EN': 2}
def genSetMemAttrArCmdBin(paddr, size, attrLst):
	"""Generate the set memory map activation record Command in binary format"""
	__opcode = 2
	__attrVal = 0
	for __attr in attrLst:
		__attrVal = __memAttrDefines[__attr] + __attrVal
	return genBinAr(__opcode, paddr, size, __attrVal, 0)
	
__memPermDefines = {'UX': 1, 'UW': 2, 'UR': 3, 'SX': 8, 'SW': 16, 'SR': 32}
def genSetMemMapArCmdBin(paddr, vaddr, size, permLst):
	"""Generate the set memory map activation record Command in binary format"""
	__opcode = 1
	__permVal = 0
	for __perm in permLst:
		__permVal = __memPermDefines[__perm] + __permVal
	return genBinAr(__opcode, paddr, vaddr, size, __permVal)
	
def genMemCpyArCmdBin(dAddr, Saddr, nBytes):
	"""Generate the memory copy activation record Command in binary format"""
	__opcode = 3
	return genBinAr(__opcode, dAddr, Saddr, nBytes, 0)

def genMemSetArCmdBin(dAddr, byte, nBytes):
	"""Generate the memory set activation record Command in binary format"""
	__opcode = 4
	return genBinAr(__opcode, dAddr, byte, nBytes, 0)
	
def genArFile(coreId, AppName, ArCmds, fPath):
	"""Generate an Activation Record C File"""
	__fcList = []
	__fName = 'arCore' + coreId + AppName + '.c'
	__brief = 'This is a generated file. This file contains the activation records for loading ' + AppName + ' on core ' + coreId
	__fHdr = genFileHdr(__fName, __brief)
	__fcList.append(__fHdr)
	__fMacros = genArFileMacros()
	__fcList.append(__fMacros)
	__arVariableStart = 'const activationRecord_t ' + 'core' + coreId + AppName + '[] = {'
	__fcList.append(__arVariableStart)
	for line in ArCmds:
		__fcList.append(line)
	__arVariableEnd = '};'
	__fcList.append(__arVariableEnd)
	writeFile(os.path.join(fPath, __fName), __fcList)

def genArFileBin(coreId, AppName, ArCmds, fPath):
	"""Generate an Activation Record Binary File"""
	__fName = 'arCore' + coreId + AppName
	writeFileBin(os.path.join(fPath, __fName), ArCmds)
	return os.path.join(fPath, __fName)
	
def genAppDeploymentFileBin(dList, fs):
	__fname = os.path.join(fs.getrootDir(), 'appdepcfg')
	__appList = ''
	for appName in dList:
		__appList = __appList + appName + '\0'
	writeFileBin(__fname, __appList)
	__fSize = os.path.getsize(__fname)
	if fs.addFile('appdepcfg', __fSize, None, None, False) != True:
		return -1
	return None
	
# Run Prelinker on the APP's & DSO's
def runPrelinker(aList, libList, pCmdFileName, outDir):
	# NOTE: Workaround for the prelinker assumption that a file soname matches its input file name in the command file
	# Copy all the input files to a temporary directory and run the prelinker there
	__prelinkTmpDir = tempfile.mkdtemp()

	prelinkCmds = []
	# Add the prelink file extension command
	prelinkCmds.append('--prelink_extension="pdo"')
	# Add the prelink output directory command
	prelinkCmds.append('--prelink_directory=' + '"' + __prelinkTmpDir + '"')
	prelinkCmds.append(' ')

	for app in aList:
		__appName = app.getName()
		copyFile(app.getFile(), os.path.join(__prelinkTmpDir,__appName))
		# Add the File dependency List
		prelinkCmds.append('"' + os.path.join(__prelinkTmpDir,__appName) + '"')
		
	for k,v in libList.items():
		__libName = v.getName()
		copyFile(v.getFile(), os.path.join(__prelinkTmpDir,__libName))
		# Add the File dependency List
		prelinkCmds.append(os.path.join('"' + __prelinkTmpDir,__libName) + '"')

	prelinkCmds.append(' ')

	# Add the Segment Address Instructions
	for app in aList:
		__cmdList = app.generatePrelinkCmds(__prelinkTmpDir)
		for cmd in __cmdList:
			prelinkCmds.append(cmd)
	for k,v in libList.items():
		__cmdList = v.generatePrelinkCmds(__prelinkTmpDir)
		for cmd in __cmdList:
			prelinkCmds.append(cmd)
		
	# Write prelink cmd file
	writeFile(pCmdFileName, prelinkCmds)

	#NOTE: Prelinker workaround
	__tmpPrelinkCmdFile = os.path.join(__prelinkTmpDir,'prelink.cmd')
	copyFile(pCmdFileName, __tmpPrelinkCmdFile)

	# Run Prelinker
	retCode = executeShellCmd(prelinkCmd, __tmpPrelinkCmdFile)
	if retCode !=0 :
		return retCode

	# copy all prelinked files to the filesystem directory
	for app in aList:
		__name = app.getName()
		__root, __ext = os.path.splitext(__name)
		__fileName = __root + '.' + 'pdo'
		copyFile(os.path.join(__prelinkTmpDir,__fileName), os.path.join(outDir,__name))
		
	for k,v in libList.items():
		__name = v.getName()
		__root, __ext = os.path.splitext(__name)
		__fileName = __root + '.' + 'pdo'
		copyFile(os.path.join(__prelinkTmpDir,__fileName), os.path.join(outDir,__name))
		
	# Remove the prelinker temporary directory
	shutil.rmtree(__prelinkTmpDir)
	return 0

# Create symbol relocation GEL command
def genSymbolRelocGelCmd(app):
	"""Generate the symbol relocation command for CCS GEL file"""
	appName = app.getName().replace('.', '_')
	filePath = os.path.abspath(app.getOrgFile()).replace('\\', '/')
	relocList = app.getRelocList()
	gelfunction = 'load_symbols_' + appName + '()' + '\n'
	command = 'GEL_SymbolAddELFRel'
	cmd = gelfunction + '{' + '\n' + '\t' + command + '('
	cmd = cmd + '"' + filePath + '"' + ',' + '""' + ',' + '""'
	cmd = cmd + relocList + ');' + '\n'
	cmd = cmd + '\t' + 'GEL_TextOut("Symbols loaded for ' + appName + '");' + '\n'
	cmd = cmd + '}'
	cmd = cmd + '\n'
	return cmd 

# Create CCS GEL hotmenu items 
def genHotmenuItemsCmd(appList):
	"""Generate the hotmenu items for CCS GEL file"""
	menuitem = 'menuitem "Multicore Application Deployment"' + '\n'
	unloadcmd = 'GEL_UnloadAllSymbols();' + '\n'
	cmd = menuitem
	for app in appList:
		appName = app.getName().replace('.', '_')
		loadcmd = 'load_symbols_' + appName + '();' + '\n'
		cmd = cmd + 'hotmenu refresh_symbols_' + appName + '()' + '\n'
		cmd = cmd + '{' + '\n'
		cmd = cmd + '\t' + unloadcmd
		cmd = cmd + '\t' + loadcmd
		for dso in app.getDepLibList():
			dsoName = dso.getName().replace('.', '_')
			loadcmd = 'load_symbols_' + dsoName + '();' + '\n'
			cmd = cmd + '\t' + loadcmd
		cmd = cmd + '}' + '\n'
		cmd = cmd + '\n'
	return cmd 

# Create GEL for symbolic debugging
def genGelFile(filePath, appList, dsoList):
	__fname = os.path.join(filePath, 'mad_load_symbols.gel')
	__appList = []
	__cmdList = []
	for app in appList:
		__appList.append(app)
		__cmdList.append(genSymbolRelocGelCmd(app))
	for dso in dsoList:
		__cmdList.append(genSymbolRelocGelCmd(dso))
	__cmdList.append(genHotmenuItemsCmd(__appList))
	writeFile(__fname, __cmdList)

#Add MAD Loader to the filesystem
def addLoaderToFs(fs):
	retVal = None
	__fSize = os.path.getsize(malLoader)
	__fname = 'mal_app'
	__align = 4096
	__segOffset = 0
	if fs.addFile(__fname, __fSize, __align, __segOffset, False) != True:
		retVal = -1
		return retVal
	__fsDir = fs.getrootDir()
	__dest = os.path.join(__fsDir, __fname)
	copyFile(malLoader, __dest)
	__malAppFileOffset = fs.getFileOffset(__fname)
	__malAppElfFile = elfFile(__dest)

	__fSize = os.path.getsize(nmlLoader)
	__fname = 'nml'
	__align = 4096
	__segOffset = 0
	if fs.addFile(__fname, __fSize, __align, __segOffset, False) != True:
		retVal = -2
		return retVal
	__dest = os.path.join(__fsDir, __fname)
	copyFile(nmlLoader, __dest)
	__nmlFileOffset = fs.getFileOffset(__fname)
	__nmlElfFile = elfFile(__dest)

	# Since mal_app & nml are "execute in place" ensure that they have been
	# linked to correct address
	__malAppElfFile.parse()
	__nmlElfFile.parse()
	__malAppFirstSeg = __malAppElfFile.getSegByIdx(0)
	__malAppFirstSegOffset = __malAppFirstSeg.getFileOffset()
	__malAppFirstSegVaddr = __malAppFirstSeg.getVaddr()
	__nmlFirstSeg = __nmlElfFile.getSegByIdx(0)
	__nmlFirstSegOffset = __nmlFirstSeg.getFileOffset()
	__nmlFirstSegVaddr = __nmlFirstSeg.getVaddr()
	__fsStartVaddr = fs.getVaddr()

	__malAppFileVaddr = __fsStartVaddr + __malAppFileOffset + __malAppFirstSegOffset
	if __malAppFileVaddr != __malAppFirstSegVaddr:
		print 'ERROR: mal_app placement in filesystem invalidates its linked \
address. Please link mal_app assuming file placement at address', dec2hex(__malAppFileVaddr)
		retVal = -3

	__nmlFileVaddr = __fsStartVaddr + __nmlFileOffset + __nmlFirstSegOffset
	if __nmlFileVaddr != __nmlFirstSegVaddr:
		print 'ERROR: nml placement in filesystem invalidates its linked \
address. Please link nml assuming file placement at address', dec2hex(__nmlFileVaddr)
		retVal = -4

	return retVal
	
	
# Add all APP & DSO Elf files to the filesystem
# altDir: specifies the alternate directory from which prelinked files should be picked up to get size
def addExeToFs(Fs, aList, libList, altDir, bypassPrelink):
	retVal = None
	for a in aList:
		if bypassPrelink:
			seg = None
		else:
			seg = a.getXIPSegment()
		if seg == None:
			__segOffset = None
			__align = None
		else:
			__segOffset = seg.getFileOffset()
			__align = seg.getAlignment()
		
		# __align == 0 or __align ==1 means the segment has not specific alignment requirements
		if (__align == 0) or (__align ==1):
			__align = None
			
		__fname = a.getName()
		if altDir == None:
			__fSize = os.path.getsize(a.getFile())
		else:
			__fSize = os.path.getsize(os.path.join(altDir,__fname))
		if Fs.addFile(__fname, __fSize, __align, __segOffset, True) != True:
			retVal = -1

	if retVal:
		return retVal

	if bypassPrelink:
		return retVal

	# Add DSO Elf files to the filesystem	
	for k,v in libList.items():
		seg = v.getXIPSegment()
		if seg == None:
			__segOffset = None
			__align = None
		else:
			__segOffset = seg.getFileOffset()
			__align = seg.getAlignment()

		# __align == 0 or __align ==1 means the segment has no specific alignment requirements
		if (__align == 0) or (__align ==1):
			__align = None
			
		__fname = k
		if altDir == None:
			__fSize = os.path.getsize(v.getFile())
		else:
			__fSize = os.path.getsize(os.path.join(altDir,__fname))
		if Fs.addFile(__fname, __fSize, __align, __segOffset, True) != True:
			retVal = -2
	return retVal

# Do virtual address assignment for all Loadable segments
def assignVaddrToSeg(pList,aList,libList,Fs):
	retVal = None
	for p in pList:
		p.resetAddrAssignInfo()	
		if p.assignAddrToSegments(aList, libList, Fs) != True:
			print 'ERROR: assignAddrToSegments Failed in Partiton:', p.getName()
			retVal = -1
	return retVal

# Generate Application activation Records
def genArRecords(aList, coreList, fsDir, dev, loadImageFs, bypassPrelink):
	__arFileList = []
	for a in aList:
		coreSet = a.getAllowedCoreSet()
		for c in coreSet:
			__arCmdList = []
			__arCmdListBin = []
			__CoreArCmdList = []
			__CoreArCmdListBin = []
			__AppArCmdList = []
			__AppArCmdListBin = []
			if bypassPrelink:
				# Generate APP specific activation record
				(__AppArCmd, __AppArCmdBin) = a.genAr(c, loadImageFs)
				if __AppArCmd != None:
					for line in __AppArCmd:
						__AppArCmdList.append(line)
					for line in __AppArCmdBin:
						__AppArCmdListBin.append(line)
			else: # in prelinker mode
				__pList = coreList[c].getPartitionList()
				# Sort the list in descending order of partition priority 
				# this is done to ensure that activation records for MEMMAP are in order (lower priority first)
				__pList.sort(key=lambda p: p.getPriority())
				for p in __pList:
					# Generate Core specific activation record
					(__coreArCmd, __coreArCmdBin) = p.genCoreAr(c, dev)
					if __coreArCmd != None:
						for line in __coreArCmd:
							__CoreArCmdList.append(line)
						for line in __coreArCmdBin:
							__CoreArCmdListBin.append(line)					
					# Generate APP specific activation record
					(__AppArCmd, __AppArCmdBin) = p.genAppAr(a, c, loadImageFs)
					if __AppArCmd != None:
						for line in __AppArCmd:
							__AppArCmdList.append(line)
						for line in __AppArCmdBin:
							__AppArCmdListBin.append(line)

			for line in __CoreArCmdList:
				__arCmdList.append(line)
			for line in __CoreArCmdListBin:
				__arCmdListBin.append(line)
			for line in __AppArCmdList:
				__arCmdList.append(line)
			for line in __AppArCmdListBin:
				__arCmdListBin.append(line)

			genArFile(str(c), a.getName(), __arCmdList, activationRecordsDir)
			__arFileList.append(genArFileBin(str(c), a.getName(), __arCmdListBin, fsDir))
	return __arFileList
	
# Add activation records to filesystem
def addArToFs(Fs, arFileList):
	retVal = None
	__segOffset = None
	__align = None
	for arFile in arFileList:
		root, __fname = os.path.split(arFile)
		__fSize = os.path.getsize(arFile)
		if Fs.addFile(__fname, __fSize, __align, __segOffset, False) != True:
			retVal = -1
	return retVal
	
# Create PAD file
def createPadFile(__fname, __size):
	__fd = open(__fname, 'wb')
	for i in range(__size):
		__fd.write('F')
	__fd.close()
	
class device:
# stores [# cores, has MPAX]
	__id	= ''
	__deviceToCore = { 'C6678' : [8, True], 'C6670' : [4, True], 'C6472' : [6,
        False], 'C6657' : [2, True] }
	
	def __init__(self,id):
		if id.upper() in self.__deviceToCore:
			self.__id = id.upper()
		else:
			return None
		
	def numCores(self):
		return self.__deviceToCore[self.__id][0]
		
	def hasMPAX(self):
		return self.__deviceToCore[self.__id][1]


class mapToolCfg:
	__cfgFilename = None
	__deploymentCfgFile = None
	__fileSystemDir = None
	__activationRecordsDir = None
	__LoadImageName = None
	__prelinkCmd = None
	__stripCmd = None
	__ofdTool = None
	__malLoader = None
	__nmlLoader = None
	__prelinkCmdFileName = None
	__imageDir = None
	__fsOffsetsFileName = None
	__appImagesDir = None
	__tmpDir = None

	def __init__(self,cfgFile):
		self.__cfgFilename = cfgFile
		self.__tmpDir = './tmp'
		self.__imageDir = './images'
		self.__prelinkCmdFileName = os.path.join(self.__tmpDir, 'prelink.cmd')
		self.__activationRecordsDir = self.__tmpDir + '/ar'
		self.__fileSystemDir = self.__tmpDir + '/fs'
		self.__appImagesDir = './images/appImages'
		self.__fsOffsetsFileName = os.path.join(self.__tmpDir, 'fsOffsets.txt')
		if os.path.exists(self.__tmpDir):
			shutil.rmtree(self.__tmpDir)
		if os.path.exists(self.__imageDir):
			shutil.rmtree(self.__imageDir)
		if not os.path.exists(self.__activationRecordsDir):
			os.makedirs(self.__activationRecordsDir)
		if not os.path.exists(self.__fileSystemDir):
			os.makedirs(self.__fileSystemDir)	
		if not os.path.exists(self.__imageDir):
			os.makedirs(self.__imageDir)	
		if not os.path.exists(self.__appImagesDir):
			os.makedirs(self.__appImagesDir)	
			
	def getDeploymentCfgFile(self):
		return self.__deploymentCfgFile
			
	def getFileSystemDir(self):
		return self.__fileSystemDir
		
	def getActivationRecordsDir(self):
		return self.__activationRecordsDir
		
	def getLoadImageName(self):
		return self.__LoadImageName

	def getImageDir(self):
		return self.__imageDir

	def getPrelinkCmd(self):
		return self.__prelinkCmd

	def getStripCmd(self):
		return self.__stripCmd

	def getOfdTool(self):
		return self.__ofdTool

	def getMalLoader(self):
		return self.__malLoader	

	def getNmlLoader(self):
		return self.__nmlLoader	

	def getPrelinkCmdFileName(self):
		return self.__prelinkCmdFileName	
		
	def getfsOffsetsFileName(self):
		return self.__fsOffsetsFileName
		
	def getAppImagesDir(self):
		return self.__appImagesDir
		
	def getTmpDir(self):
		return self.__tmpDir
		
	# Parse the MAP tool configuration file
	def parseFile(self):
		if os.path.isfile(self.__cfgFilename) != True:
			print 'MAP Tool Configuration file not found'
			return -1
		with open(self.__cfgFilename, 'r') as fd:
			config = json.load(fd)

		#get deploymentCfgFile
		if 'deploymentCfgFile' in config:
			self.__deploymentCfgFile = config['deploymentCfgFile']
		else:
			print 'deploymentCfgFile object not present in MAP Tool Configuration file'
			return -1
	
		#get LoadImageName
		if 'LoadImageName' in config:
			self.__LoadImageName = os.path.join(self.__imageDir,config['LoadImageName'])
		else:
			print 'LoadImageName object not present in MAP Tool Configuration file'
			return -1
			
		#get prelinkExe
		if 'prelinkExe' in config:
			self.__prelinkCmd = config['prelinkExe']
		else:
			print 'prelinkExe object not present in MAP Tool Configuration file'
			return -1			

		#get ofdTool
		if 'ofdTool' in config:
			self.__ofdTool = config['ofdTool']
		else:
			print 'ofdTool object not present in MAP Tool Configuration file'
			return -1				
			
		#get stripExe
		if 'stripExe' in config:
			self.__stripCmd = config['stripExe']
		else:
			print 'stripExe object not present in MAP Tool Configuration file'
			return -1			

		#get malApp
		if 'malApp' in config:
			self.__malLoader = config['malApp']
		else:
			print 'malApp object not present in MAP Tool Configuration file'
			return -1
			
		#get nmlLoader
		if 'nmlLoader' in config:
			self.__nmlLoader = config['nmlLoader']
		else:
			print 'nmlLoader object not present in MAP Tool Configuration file'
			return -1
			
		return 0
	# END: parseFile()
		
class fsFile:
	name = ''
	alignment = 0
	size = 0
	segOffset = 0
	hdrSz = 0
	fileOffset = 0
	
	def __init__(self, fName, align, segOffset, size, hdrSz, fileOffset):
		self.name = fName
		self.alignment = align
		self.segOffset = segOffset
		self.size = size
		self.hdrSz = hdrSz
		self.fileOffset = fileOffset
	
	def getName(self):
		return self.name

	def getFileOffset(self):
		return self.fileOffset

	def getAlignment(self):
		return self.alignment

	def dump(self):
		print 'File Name:', self.name
		print 'Alignment:', dec2hex(self.alignment)
		print 'Size:', dec2hex(self.size)
		print 'segOffset:', dec2hex(self.segOffset)
		print 'hdrSz:', dec2hex(self.hdrSz)
		print 'fileOffset:', dec2hex(self.fileOffset)


# ROMFS generation utilities
# Returns a string for romfs file header in binary formart packed in network byte order
def genBinRomFh(nextfh, spec, size, checksum):
	__fh = (nextfh, spec, size, checksum)
	__s = struct.Struct('! I I I I')
	return __s.pack(*__fh)

# Returns the space needed for a ROMFS file header
def hdrSpace(name):
	return (16 + align16(len(name)+1))

# Returns the space needed for a ROMFS file (including header)
def fileSpace(name, size):
	return (16 + align16(len(name)+1) + align16(size))
	
# Write Filename
def writeFileName(name, fd):
	fd.write(name)
	fd.write(struct.pack('B', 0))
	__len = len(name) + 1
	if (__len & 15) != 0:
		for i in range((16 - (__len&15))):
			fd.write(struct.pack('B', 0))

# Copy data from source file to destination file
def copyFileData(fdSrc, fdDest, len):
	for i in range(len):
		__s = fdSrc.read(1)
		fdDest.write(__s)
		
# Write Pad bytes (0) to a file		
def padFill(fd, padSz):
	for i in range(padSz):
		fd.write(struct.pack('B', 0))
		
# Returns a tuple (aligned FileOffset, pad)
def alignFile(align, fileHdrSz, currOffset):
	__offset = currOffset
	__pad = 0
	__alignGap = ((currOffset + fileHdrSz) & (align - 1))
	if __alignGap != 0:
		__alignFillSz = align - __alignGap
		__offset += __alignFillSz
		__pad = __alignFillSz
	return (__offset, __pad)
	
#outFileName: output romfs file name		
#Dir: Directory where the files are placed
#volName: Volume name for the filesystem
#fileList: List of tuples (alignment, fileName)
def genRomFs(outFileName, dir, volName, fileList):
	#Create out file
	__outFd = open(outFileName, 'wb')
	__currOffset = 0
	#Write ROMFS header
	__outFd.write(genBinRomFh(hex2dec('0x2d726f6d'), hex2dec('0x3166732d'), hex2dec('0x3166732d'), hex2dec('0x55555555')))
	
	#Write ROMFS volume name
	writeFileName(volName, __outFd)
	__currOffset += hdrSpace(volName)
	
	#Write file header and file data
	# Add '.' directory
	__outFd.write(genBinRomFh((__currOffset+32+9), 0, 0, 0))
	writeFileName('.', __outFd)
	__currOffset += 32
	
	# Add '..' directory
	__outFd.write(genBinRomFh((0), 0, 0, 0))
	writeFileName('..', __outFd)
	__prevFileHdrOffset = __currOffset
	__preFileHdrMode = 0
	__preFileSize = 0
	__currOffset += 32
	
	for __falign, __fname in fileList:
		__filePathName = os.path.join(dir,__fname)
		__fileSz = os.path.getsize(__filePathName)
		__hdrSz = hdrSpace(__fname)
		__offset, __padSz = alignFile(__falign, __hdrSz, __currOffset)
		# Write the pad bytes
		if __padSz != 0:
			padFill(__outFd, __padSz)
			__currOffset += __padSz
		# Update the nextfh offset in the previous file hdr
		__outFd.seek(__prevFileHdrOffset)
		__outFd.write(genBinRomFh((__currOffset+__preFileHdrMode),0,__preFileSize,0))
		__outFd.seek(0,os.SEEK_END)
		# Write file header
		__prevFileHdrOffset = __currOffset
		__preFileHdrMode = 10 # Regular file + exec
		__preFileSize = __fileSz
		__outFd.write(genBinRomFh(0, 0, __fileSz, 0))
		writeFileName(__fname, __outFd)
		__currOffset += __hdrSz
		# Write file data
		__srcFile = open(__filePathName, 'rb')
		copyFileData(__srcFile,__outFd, __fileSz)
		__currOffset += __fileSz
		
	# Update ROMFS file size
	# Update ROMFS header checksum
	__outFd.seek(0)
	__outFd.write(genBinRomFh(hex2dec('0x2d726f6d'), hex2dec('0x3166732d'), align16(__currOffset), hex2dec('0x55555555')))
	__outFd.seek(0,os.SEEK_END)
	# Align the whole file size to 1024
	if (__currOffset & 1023):
		padFill(__outFd, (1024 - (__currOffset&1023)))
	__outFd.close()

		
class fileSystem:
	type = 'ROMFS'
	rootDir = ''	# Path to Root directory
	fileList = None	# List of files (python List of fsFile Objects )
	vaddr = 0
	__NextFileHdrOffset = 0
	__numPadFiles = 0
	__padFileStr = 'PAD'
	__padSize = 1024	# optional extra padding added to a file to give room for it to grow during pre-link stage
	__fsGenList = None	# List of files with alignment to be added to the filesystem
	
	def __init__(self, rootDir, vaddr):
		self.rootDir = rootDir
		self.fileList = []
		self.vaddr = vaddr
		self.__NextFileHdrOffset = 80 # ROMFS Header (16B) + . (32B) + .. (32B)
		self.__fsGenList = []
	
	def getFileOffset(self, fName):
		for file in self.fileList:
			if file.getName() == fName:
				return file.getFileOffset()
		return None
		
	def getVaddr(self):
		return self.vaddr
		
	def getrootDir(self):
		return self.rootDir
	
	# Add a file to ROMFS
	# File data will be placed in ROMFS at an offset x 
	# where (vaddr + x + SegOffset)%align = 0
	# TODO:
	# addPad: if True an extra pad of __padSize bytes will be added to the file
	def addFile(self, fName, fSize, align, SegOffset, addPad):
		for file in self.fileList:
			if file.getName() == fName:
				print 'ERROR: addFile() File name already exists'
				return False
				
		# Check if the segment has any specific alignment needs
		# if not then use default 16 byte alignment guaranteed by ROMFS
		if (align == None):
			align = 16
			SegOffset = 0
			
		__fNameLen = len(fName)
		__extraHdrsz = 16 * (__fNameLen/16)
		__hdrSz = 32 + __extraHdrsz
		__fOffset = self.__NextFileHdrOffset + __hdrSz
		__alignmentGap = (self.vaddr + __fOffset + SegOffset) % align
			
		if __alignmentGap != 0:
			__alignmentPad = __alignmentGap
			__alignmentPad = align - __alignmentGap
			if ((__alignmentPad % 16) != 0):
				print 'ERROR: addFile() Cannot satisfy alignment requirement(1) for the file:', fName
				return False
			
			# ROMFS supports alignment requirements for file data
			# We can use the ROMFS alignment support if (SegOffset % align) == 0
			if (SegOffset % align == 0):
				# use the ROMFS alignment functionality here	
				self.__NextFileHdrOffset += __alignmentPad
				__fOffset = self.__NextFileHdrOffset + __hdrSz
				__fFile = fsFile(fName, align, SegOffset, fSize, __hdrSz, __fOffset)
				self.fileList.append(__fFile)
				self.__fsGenList.append((align,fName))
				#Calculate __NextFileHdrOffset aligned to 16 bytes
				self.__NextFileHdrOffset += align16(fSize + __hdrSz)
				return True
			
			# if we reached here it means a PAD file has to be used for meeting the alignment requirements
			# Insert a pad file to take care of alignment
			# Cannot use PAD files for alignment pad requirements less than 32 bytes
			if (__alignmentPad < 32):
				print 'ERROR: addFile() Cannot satisfy alignment requirement(2)for the file:', fName
				return False
				
			__pFileHdrSz = 32
			__pFileSz = __alignmentPad - __pFileHdrSz
			__pFileOffset = self.__NextFileHdrOffset + __pFileHdrSz
			__pFileName = self.__padFileStr + str(self.__numPadFiles)
			__pFile = fsFile(__pFileName, 16, 0, __pFileSz, __pFileHdrSz, __pFileOffset)
			createPadFile(os.path.join(self.rootDir, __pFileName), __pFileSz)
			self.fileList.append(__pFile)
			self.__fsGenList.append((16,__pFileName))
			self.__numPadFiles += 1
			self.__NextFileHdrOffset += align16(__pFileSz + __pFileHdrSz)
			
		# Now insert the requested file 
		__fOffset = self.__NextFileHdrOffset + __hdrSz
		__fFile = fsFile(fName, 16, SegOffset, fSize, __hdrSz, __fOffset)
		self.fileList.append(__fFile)
		self.__fsGenList.append((16,fName))
		#Calculate __NextFileHdrOffset aligned to 16 bytes
		self.__NextFileHdrOffset += align16(fSize + __hdrSz)
		return True
		
	def dump(self):
		print 'FStype:', self.type
		print 'RootDir:', self.rootDir
		print 'Vaddr:', dec2hex(self.vaddr)
		print 'NxtFileHdrOffset:', dec2hex(self.__NextFileHdrOffset)
		print '# Pad Files:', self.__numPadFiles
		print 'fsGenerator List:', self.__fsGenList
		print 'FileList:' 
		print ''
		for f in self.fileList:
			f.dump()
			print''
	
	def dumpFileoffsets(self, outFname):
		__fContent = []
		for __file in self.fileList:
			__offset = __file.getFileOffset()
			__offsetStr = __file.getName() + ':' + '\t' + dec2hex(__offset)
			__fContent.append(__offsetStr)	
		writeFile(outFname, __fContent)
			
	def genFsImage(self, outFileName):
		# Run the filesystem generator
		genRomFs(outFileName, self.rootDir, 'MadLoadImage', self.__fsGenList)
		
class permission:
	attrList	= None
	
	def __init__(self):
		self.attrList = {'UR': False, 'UW': False, 'UX': False, 'SR': False, 'SW': False, 'SX': False}
		
	def getAttrVal(self, attr):
		return self.attrList[attr]
	
	# Returns a python list of the attributes set in the permission
	def getValidAttrs(self):
		attrList = []
		for attr, val in self.attrList.items():
			if val == True:
				attrList.append(attr)
		return attrList
			
	def setPermission(self, attr, value):
		if isinstance(value,bool) != True:
			print 'Invalid Permission value'
			return False
		if self.attrList.has_key(attr) != True:
			print 'Invalid Permission attribute'
			return False
		self.attrList[attr] = value
		return True

	def isPermissionCompatible(self, perm):
		if isinstance(perm,permission)!=True:
			return False
		for attr, val in perm.attrList.items():
			if val == True:
				if self.attrList[attr] != True:
					print 'ERROR: Incompatable permission attribute'
					return False	
		return True
		
	def isPermissionExact(self, perm):
		if isinstance(perm,permission)!=True:
			return False
		for attr, val in self.attrList.items():
			if val == True:
				if perm.attrList[attr] != True:
					return False	
		return True
		
	def dump(self):
		for attr in self.attrList:
			print attr,':', self.attrList[attr]
	
class partition:
	name	=	''
	paddr	=	None
	vaddr	=	0	
	size	=	0
	sectionPattern = None 		# List of section names
	containedSegments = None 	# List of segment to be placed in this partition per APP (python dictionary)
								# Keep this list sorted in descending order of alignment requirements 
								# Use insertion sort while adding to the array
	cores = None				# List of applicable cores (python set)
	permissions = None
	cacheEnable	= False
	prefetch	= False
	loadPartition = None
	__nextAvailVaddr = 0
	shared = True
	priority = 0
	bypassPrelink = False
	
	def __init__(self, name, paddr, vaddr, size, load, priority, dev,
				 bypassPrelink):
		self.bypassPrelink = bypassPrelink
		self.name = name
		self.vaddr = hex2dec(vaddr)
		self.paddr = []
		if (not self.bypassPrelink):
			if dev.hasMPAX():
				for addr in paddr:
					__paddr = addr[0:len(addr)-1]  #ignore the last 4 bits : paddr for a partition will always be atleast 4K aligned
					self.paddr.append(hex2dec(__paddr))
			else:
				for i in range(dev.numCores()):
					self.paddr.append(self.vaddr)	
		self.__nextAvailVaddr = self.vaddr
		self.size = hex2dec(size)
		self.loadPartition = load
		self.priority = priority
		self.sectionPattern = []
		self.containedSegments = dict()
		self.cores = set()

	def getName(self):
		return self.name
		
	def getVaddr(self):
		return self.vaddr

	def getPaddr(self, coreId):
		return self.paddr[coreId]
		
	def getPriority(self):
		return self.priority
		
	def getSize(self):
		return self.size

	def dump(self):
		print 'name:', self.name
		print 'paddr:', self.paddr
		print 'vaddr:', dec2hex(self.vaddr)
		print 'size:', dec2hex(self.size)
		print 'sectionPattern:', self.sectionPattern
		print 'containedSegments:'
		for a, slist in self.containedSegments.iteritems():
			print 'Application:', a
			print 'Segment List:'
			for seg in slist:
				seg.dump()
		print 'cores:', self.cores
		print 'permissions:'
		self.permissions.dump()
		print 'cacheEnable:', self.cacheEnable
		print 'prefetch:', self.prefetch
		print 'loadPartition:', self.loadPartition
		print ''
	
	def isLoadPartition(self):
		return self.loadPartition

	def resetAddrAssignInfo(self):
		self.__nextAvailVaddr = self.vaddr
		
	def setMemAttr(self, cacheEn, prefetchEn, shared):
		if isinstance(cacheEn,bool) != True:
			print 'Invalid value for cacheEnable'
			return False
		if isinstance(prefetchEn,bool) != True:
			print 'Invalid value for prefetchEn'
			return False
		if isinstance(shared,bool) != True:
			print 'Invalid value for shared'
			return False
		self.cacheEnable = cacheEn
		self.prefetch = prefetchEn
		self.shared = shared
		return True
		
	def addCore(self, core):
		if core in self.cores:
			return False
		else:
			self.cores.add(core)
			return True

	def getCoreSet(self):
		return self.cores
			
	def containsCore(self, core):
		if core in self.cores:
			return True
		else:
			return False
			
	def addSectionPattern(self, section):
		if section in self.sectionPattern:
			return False
		else:
			self.sectionPattern.append(section)
			return True

	def getSectionPattern(self):
			return self.sectionPattern
	
	def addSegment(self, appName, segObj):
		if isinstance(segObj,segment)!=True:
			return False
		# Check if permissions are compatible
		segPerm = segObj.getPermissionAttrs()
		if self.permissions.isPermissionCompatible(segPerm) != True:
			return False
		# Warn for not exact match
		if self.permissions.isPermissionExact(segPerm) != True:
			print 'Info: Incompatible permissions for segment:', segObj.getIdx(), ' application:', appName, 'in partition:', self.name
		if appName not in self.containedSegments:
			self.containedSegments[appName] = []
		self.containedSegments[appName].append(segObj)
		#self.containedSegments[appName].sort(key = lambda seg: seg.getAlignment(), reverse = True)
# Workaround  to preserve ordering of DP addressed data segments: 
# While doing address allocation for segments preserve the relative ordering of
# segments from the original ELF files, this can be done by ordering the
# segments in ascending order of original address in the ELF file 
		self.containedSegments[appName].sort(key = lambda seg: seg.getVaddr())
		return True
		
	def addPermissions(self, perm):
		if isinstance(perm,permission)!=True:
			return False
		else:
			self.permissions = perm
			return True

	def getPermissionAttrs(self):
		return self.permissions
		
	def __assignVaddrToSegments(self, appList, libList):
		__nextAvailLibVaddr = self.vaddr
		__totalLibSize = 0
		# Assign vaddr to DSO's
		for name,obj in libList.items():
			if name not in self.containedSegments:
				continue
			__tmpSegList = self.containedSegments[name]	
			for seg in __tmpSegList:
				__align = seg.getAlignment()
				# Check if the segment has any specific alignment requirement
				if (__align == 0):
					__align = 1
				__tmpStartAddr = __nextAvailLibVaddr
				__tmpAlignGap	= __tmpStartAddr % __align
				if (__tmpAlignGap):
					__tmpAlignGap	= __align - __tmpAlignGap
				__tmpStartAddr	= __tmpStartAddr + __tmpAlignGap
				__tmpSize		= __tmpAlignGap + seg.getMemSize()
				__totalLibSize += __tmpSize
				if __totalLibSize > self.size:
					print 'ERROR: assignAddrToSegments() - Partition Size Overflow'
					return False
				else:
					seg.setModVaddr(__tmpStartAddr)
					__nextAvailLibVaddr += __tmpSize
					
		# Assign vaddr to App's	
		__AppStartVaddr = __nextAvailLibVaddr
		__totalSize = __totalLibSize
		__nextAvailAppVaddr = __AppStartVaddr
		for app in appList:
			name = app.getName()
			if name not in self.containedSegments:
				continue
			__tmpSegList = self.containedSegments[name]	
			if self.shared == False:
				__nextAvailAppVaddr = __AppStartVaddr
				__totalSize = __totalLibSize				
			for seg in __tmpSegList:
				__align = seg.getAlignment()
				# Check if the segment has any specific alignment requirement
				if (__align == 0):
					__align = 1
				__tmpStartAddr = __nextAvailAppVaddr
				__tmpAlignGap	= __tmpStartAddr % __align
				if (__tmpAlignGap):
					__tmpAlignGap	= __align - __tmpAlignGap
				__tmpStartAddr	= __tmpStartAddr + __tmpAlignGap
				__tmpSize		= __tmpAlignGap + seg.getMemSize()
				__totalSize += __tmpSize
				if __totalSize > self.size:
					print 'ERROR: assignAddrToSegments() - Partition Size Overflow'
					return False
				else:
					seg.setModVaddr(__tmpStartAddr)
					__nextAvailAppVaddr += __tmpSize		
		return True	
		
	def __xipAssignVaddrToSegments(self, appList, libList, fsObj):
		# vaddr = vaddr of filesystem + offset of ELF file in ROMFS + offset of segment in ELF file
		for name,obj in libList.items():
			if name not in self.containedSegments:
				continue
			for seg in self.containedSegments[name]:
				__fsVaddr = fsObj.getVaddr()
				__elfOffset = fsObj.getFileOffset(name)
				__segOffset = seg.getFileOffset()
				__vaddr = __fsVaddr + __elfOffset + __segOffset
				# Check if vaddr is in the partition range
				if (self.vaddr < __vaddr < (self.vaddr + self.size)) != True:
					print 'ERROR: xipAssignAddrToSegments() - Invalid file or segment offset'
					return False			
				# Check if vaddr satisfies the segment's alignment requirement 
 				if ( __vaddr % seg.getAlignment() ) != 0:
 					print 'ERROR: xipAssignAddrToSegments() - segment:', seg.getIdx(), 'in app:', name,' cannot be made XIP'
					return False
				seg.setModVaddr(__vaddr)
				
		for app in appList:
			name = app.getName()
			if name not in self.containedSegments:
				continue
			for seg in self.containedSegments[name]:
				__fsVaddr = fsObj.getVaddr()
				__elfOffset = fsObj.getFileOffset(name)
				__segOffset = seg.getFileOffset()
				__vaddr = __fsVaddr + __elfOffset + __segOffset
				# Check if vaddr is in the partition range
				if (self.vaddr < __vaddr < (self.vaddr + self.size)) != True:
					print 'ERROR: xipAssignAddrToSegments() - Invalid file or segment offset'
					return False			
				# Check if vaddr satisfies the segment's alignment requirement 
 				if ( __vaddr % seg.getAlignment() ) != 0:
 					print 'ERROR: xipAssignAddrToSegments() - segment:', seg.getIdx(), 'in app:', name,' cannot be made XIP'
					return False
				seg.setModVaddr(__vaddr)			
		return True

	def assignAddrToSegments(self, appList, libList, fsObj):
		if self.loadPartition != True:
			return self.__assignVaddrToSegments(appList, libList)
		else:
			return self.__xipAssignVaddrToSegments(appList, libList, fsObj)
	
	# Generate Core specific Activation records
	# Return the activation records in both C code and binary format
	def genCoreAr(self, coreId, dev):
		if self.containsCore(coreId) != True:
			print 'partition', self.name, 'not applicable to core', coreId 
			return (None, None)
		__arCmds = []
		__arCmdsBin = []
		# MEMMAP command also sets the permissions
		__validAttrs = self.permissions.getValidAttrs()
		__attrStr = None
		for attr in __validAttrs:
			if __attrStr != None:
				__attrStr = attr + '|' + __attrStr
			else:
				__attrStr = attr
		__attrStr = '(' + __attrStr
		__attrStr = __attrStr + ')'		
		__memMapCmd = genSetMemMapArCmd(dec2hex(self.paddr[coreId]), dec2hex(self.vaddr), dec2hex(self.size), __attrStr)
		__memMapCmdBin = genSetMemMapArCmdBin(self.paddr[coreId], self.vaddr, self.size, __validAttrs)
			
		__attrLst = []
		__attrStr = '('
		if self.cacheEnable:
			__attrStr = __attrStr + 'CACHE_EN' + '|'
			__attrLst.append('CACHE_EN')
		if self.prefetch:
			__attrStr = __attrStr + 'PREFETCH_EN'
			__attrLst.append('PREFETCH_EN')
		else:
			__attrStr = __attrStr + '0'
		__attrStr = __attrStr + ')'
		
		__memAttrCmd = genSetMemAttrArCmd(dec2hex(self.paddr[coreId]), dec2hex(self.size), __attrStr)
		__memAttrCmdBin = genSetMemAttrArCmdBin(self.paddr[coreId], self.size, __attrLst)
		
		if __memMapCmd != None:
			__arCmds.append(__memMapCmd)
		__arCmds.append(__memAttrCmd)
		if __memMapCmdBin != None:
			__arCmdsBin.append(__memMapCmdBin)
		__arCmdsBin.append(__memAttrCmdBin)
		return (__arCmds, __arCmdsBin)

	# Generate Application specific Activation records
	# Return the activation records in both C code and binary format
	def genAppAr(self, appObj, coreId, fsObj):
		if self.loadPartition == True:
			return (None, None)
		appName = appObj.getName()
		if appName not in self.containedSegments:
			return (None, None)
		if self.containsCore(coreId) != True:
			print 'partition', self.name, 'not applicable to core', coreId 
			return (None, None)
		__arCmds = []
		__arCmdsBin = []
		__segList = self.containedSegments[appName]
		__fsVaddr = fsObj.getVaddr()
		for seg in __segList:
			__segVaddr = seg.getModVaddr()
			__segOffset = __segVaddr - self.vaddr
			__appFsOffset = fsObj.getFileOffset(appName)
			__segSrcVaddr = __fsVaddr + __appFsOffset + seg.getFileOffset()
			__segMemSz = seg.getMemSize()
			__segFileSz = seg.getFileSize()
			__memCpyCmd = None
			if (__segFileSz != 0):
				__memCpyCmd = genMemCpyArCmd(dec2hex(__segVaddr), dec2hex(__segSrcVaddr), dec2hex(__segFileSz))
				__memCpyCmdBin = genMemCpyArCmdBin(__segVaddr, __segSrcVaddr, __segFileSz)

			__memSetCmd = None
# Memset command not being generated to reduce load time. Currently CCS also
# doesn't do this while loading a ELF file
#if (__segMemSz > __segFileSz):
#__memSetCmd = genMemSetArCmd(dec2hex(__segVaddr + __segFileSz), '0', dec2hex(__segMemSz - __segFileSz))
#__memSetCmdBin = genMemSetArCmdBin((__segVaddr + __segFileSz), 0, (__segMemSz - __segFileSz))

			if __memCpyCmd != None:
				__arCmds.append(__memCpyCmd)
				__arCmdsBin.append(__memCpyCmdBin)
			if __memSetCmd != None:
				__arCmds.append(__memSetCmd)
				__arCmdsBin.append(__memSetCmdBin)
				
		# Add the Activation record commands for all dependent libraries
		for lib in appObj.getDepLibList():
			appName = lib.getName()
			if self.containedSegments.has_key(appName) != True:
				continue		
			__segList = self.containedSegments[appName]
			for seg in __segList:
				__segVaddr = seg.getModVaddr()
				__segOffset = __segVaddr - self.vaddr
				__appFsOffset = fsObj.getFileOffset(appName)
				__segSrcVaddr = __fsVaddr + __appFsOffset + seg.getFileOffset()
				__segMemSz = seg.getMemSize()
				__segFileSz = seg.getFileSize()
				__memCpyCmd = None
				if (__segFileSz != 0):
					__memCpyCmd = genMemCpyArCmd(dec2hex(__segVaddr), dec2hex(__segSrcVaddr), dec2hex(__segFileSz))
					__memCpyCmdBin = genMemCpyArCmdBin(__segVaddr, __segSrcVaddr, __segFileSz)
				__memSetCmd = None
				if (__segMemSz > __segFileSz):
					__memSetCmd = genMemSetArCmd(dec2hex(__segVaddr + __segFileSz), '0', dec2hex(__segMemSz - __segFileSz))
					__memSetCmdBin = genMemSetArCmdBin((__segVaddr + __segFileSz), 0, (__segMemSz - __segFileSz))
					
				if __memCpyCmd != None:
					__arCmds.append(__memCpyCmd)
					__arCmdsBin.append(__memCpyCmdBin)
				if __memSetCmd != None:
					__arCmds.append(__memSetCmd)
					__arCmdsBin.append(__memSetCmdBin)
		return (__arCmds, __arCmdsBin)
		
class core:
	id			  = 0
	partitionList = None	
	def __init__(self, id):
		self.id = id
		self.partitionList = []
		
	def initPartitionList(self, pList):
		for p in pList:
			if p.containsCore(self.id) == True:
				self.partitionList.append(p)

	def getPartitionList(self):
		return self.partitionList
		
	def dump(self):
		print 'core', self.id, 'partitionList:'
		for p in self.partitionList:
			print p.name
		
class application:
	alias	= ''				# application name alias
	shlibPath	= ''			# Path to dependent DSO's
	allowedCores  = None 		# List of cores
	fileoffset	  = 0			# offset of the ELF file within ROMFS
	elfFile	= None				# Elf File object of the Application
	dependentLibs = None 		# List of all dependent DSO's
	archiveDir = None           # Directory where application image would be archived
	bypassPrelink = False
	strippedFile = ''			# full path name of the stripped application file
	fileCopy = ''               # copy of the original application
	tmpDir = ''
	
	def __init__(self, name, file, libpath, archiveDir, tmpDir, bypassPrelink):
		self.alias = name
		self.bypassPrelink = bypassPrelink
		self.shlibPath = libpath
		self.allowedCores = set()
		self.dependentLibs = []
		self.archiveDir = archiveDir
		self.tmpDir = tmpDir
		self.fileCopy = os.path.join(archiveDir, name)
		__strippedImageDir = self.tmpDir + '/strippedImages'
		if not os.path.exists(__strippedImageDir):
			os.makedirs(__strippedImageDir)
		self.strippedFile = os.path.join(__strippedImageDir, name) + '.strip'
		copyFile(file, self.fileCopy)
		# Strip the file of debug symbols
		__stripCmdArgs = '-o=' + self.strippedFile + ' ' + self.fileCopy
		executeShellCmd(stripCmd, __stripCmdArgs)
		self.elfFile = elfFile(self.strippedFile)
		
	def getName(self):
		return self.alias

	def getStrippedFileName(self):
		return self.strippedFile

	def getFile(self):
		return self.elfFile.getFile()
	
	def getOrgFile(self):
		return self.fileCopy
	
	def processElf(self, globalLibList):
		if self.elfFile.parse() != 0:
			return -1
		depLibList = self.elfFile.getDepLib()
		if (depLibList and (self.bypassPrelink)):
			print ('ERROR: application with shared library dependency cannot be use in prelink bypass mode')
			return -1
		for libName in depLibList:
			head, tail = os.path.split(libName)
			if tail in globalLibList:
				self.dependentLibs.append(globalLibList[tail])
			else:
				#create a new dso object
				file = os.path.join(self.shlibPath,tail)
				lib = dso(file,tail,globalLibList,self.archiveDir,self.tmpDir)
				self.dependentLibs.append(lib)
				globalLibList[tail] = lib
		# Create the full dependency list
		for __lib in self.dependentLibs:
			__subLibList = __lib.getDepLibList()
			if __subLibList == None:
				continue
			for __lib2 in __subLibList:
				if __lib2 in self.dependentLibs:
					continue
				else:
					self.dependentLibs.append(__lib2)
		return 0
		
	def getDepLibList(self):
		return self.dependentLibs
				
	def isCoreAllowed(self, core):
		if core in self.allowedCores:
			return True
		else:
			return False

	def getAllowedCoreSet(self):
		return self.allowedCores
		
	def addAllowedCore(self, core):
		if core in self.allowedCores:
			return False
		else:
			self.allowedCores.add(core)
			return True		
	
	# Returns the list of segment instances containing the given section name regular expression.
	# Section name should have a valid python regular expression syntax.
	def getSegFromSec(self, reSecName):
		return self.elfFile.getSegFromSec(reSecName)
		
	def getSegments(self):
		return self.elfFile.getSegments()
		
	def getStaticBaseSegment(self):
		return self.elfFile.getStaticBaseSegment()

	def getXIPSegment(self):
		return self.elfFile.getXIPSegment()
		
	def generatePrelinkCmds(self, path):
		segList = self.elfFile.getLoadableSegments()
		cmdList = []
		for seg in segList:
			idx = seg.getIdx()
			vaddr = seg.getModVaddr()
			#NOTE: Prelinker workaround to use the alias instead of full file name
			#cmdList.append(genPrelinkSegmentCmd(self.elfFile.getFile(),str(idx),dec2hex(vaddr)))
			cmdList.append(genPrelinkSegmentCmd(os.path.join(path,self.alias),str(idx),dec2hex(vaddr)))
		return cmdList
		
	# Returns a comma separated list of relocated address for each segment the application 
	def getRelocList(self):
		__reloList = ''
		__segList = self.elfFile.getSegments()
		for seg in __segList:
			__segVaddr = seg.getModVaddr()
			__reloList = __reloList + ',' + dec2hex(__segVaddr) 
		return __reloList

	# Generate Activation records
	# Return the activation records in both C code and binary format
	def genAr(self, coreId, fsObj):
		appName = self.getName()
		if self.isCoreAllowed(coreId) != True:
			print 'application:', self.name, 'can not run on core', coreId 
			return (None, None)
		__arCmds = []
		__arCmdsBin = []
		__segList = self.elfFile.getSegments()
		__fsVaddr = fsObj.getVaddr()
		for seg in __segList:
			if not seg.isLoadable():			
				continue
			__segVaddr = seg.getVaddr()
			__appFsOffset = fsObj.getFileOffset(appName)
			__segSrcVaddr = __fsVaddr + __appFsOffset + seg.getFileOffset()
			__segMemSz = seg.getMemSize()
			__segFileSz = seg.getFileSize()
			__memCpyCmd = None
			if (__segFileSz != 0):
				__memCpyCmd = genMemCpyArCmd(dec2hex(__segVaddr), dec2hex(__segSrcVaddr), dec2hex(__segFileSz))
				__memCpyCmdBin = genMemCpyArCmdBin(__segVaddr, __segSrcVaddr, __segFileSz)

			__memSetCmd = None
# Memset command not being generated to reduce load time. Currently CCS also
# doesn't do this while loading a ELF file
#if (__segMemSz > __segFileSz):
#__memSetCmd = genMemSetArCmd(dec2hex(__segVaddr + __segFileSz), '0', dec2hex(__segMemSz - __segFileSz))
#__memSetCmdBin = genMemSetArCmdBin((__segVaddr + __segFileSz), 0, (__segMemSz - __segFileSz))

			if __memCpyCmd != None:
				__arCmds.append(__memCpyCmd)
				__arCmdsBin.append(__memCpyCmdBin)
			if __memSetCmd != None:
				__arCmds.append(__memSetCmd)
				__arCmdsBin.append(__memSetCmdBin)
				
		return (__arCmds, __arCmdsBin)
		# END: genAr()
		
	def dump(self):
		print 'APP Details:'
		print 'name:', self.alias
		print 'shlibPath:', self.shlibPath
		print 'allowedCores:', self.allowedCores
		print 'dependentLibs :', self.dependentLibs
		print ''
		print '	ELF Details:'
		if self.elfFile != None:
			print 'elfFile:', self.elfFile.dump()
		print ''
			
		
class dso:
	elfFile	= None		 # Elf File object of the dso
	fileOffset	= 0		 # offset of the elf file within ROMFS
	dependentLibs = None # List of 1st level dependent DSO's (python List)
	name = ''
	fileCopy = ''
	strippedFile = ''
	
	def __init__(self, file, name, globalLibList, archiveDir, tmpDir):
		dependentLibs = []
		self.name = name
		self.fileCopy = os.path.join(archiveDir, name)
		__strippedImageDir = tmpDir + '/strippedImages'
		if not os.path.exists(__strippedImageDir):
			os.makedirs(__strippedImageDir)
		self.strippedFile = os.path.join(__strippedImageDir, name) + '.strip'
		copyFile(file, self.fileCopy)
		# Strip the file of debug symbols
		__stripCmdArgs = '-o=' + self.strippedFile + ' ' + self.fileCopy
		executeShellCmd(stripCmd, __stripCmdArgs)
		self.elfFile = elfFile(self.strippedFile)
		self.elfFile.parse()
		depLibList = self.elfFile.getDepLib()
		for libName in depLibList:
			head, tail = os.path.split(libName)
			if tail in globalLibList:
				self.dependentLibs.append(globalLibList[tail])
			else:
				#create a new dso object
				file = os.path.join(self.shlibPath,tail)
				lib = dso(file,globalLibList,archiveDir, tmpDir)
				self.dependentLibs.append(lib)
				globalLibList[tail] = lib
				
				
	# Returns the list of segment instances containing the given section name regular expression.
	# Section name should have a valid python regular expression syntax.
	def getSegFromSec(self, reSecName):
		return self.elfFile.getSegFromSec(reSecName)

	def getName(self):
		return self.name
	
	def getDepLibList(self):
		return self.dependentLibs
		
	def getFile(self):
		return self.elfFile.getFile()
		
	def getOrgFile(self):
		return self.fileCopy
	
	def getSegments(self):
		return self.elfFile.getSegments()
		
	def getXIPSegment(self):
		return self.elfFile.getXIPSegment()

	def generatePrelinkCmds(self, path):
		segList = self.elfFile.getLoadableSegments()
		cmdList = []
		for seg in segList:
			idx = seg.getIdx()
			vaddr = seg.getModVaddr()
			#NOTE: Prelinker workaround use the alias instead of full file name
			#cmdList.append(genPrelinkSegmentCmd(self.elfFile.getFile(),str(idx),dec2hex(vaddr)))
			cmdList.append(genPrelinkSegmentCmd(os.path.join(path,self.name),str(idx),dec2hex(vaddr)))
		return cmdList
		
	# Returns a comma separated list of relocated address for each segment the application 
	def getRelocList(self):
		__reloList = ''
		__segList = self.elfFile.getSegments()
		for seg in __segList:
			__segVaddr = seg.getModVaddr()
			__reloList = __reloList + ',' + dec2hex(__segVaddr) 
		return __reloList

	def dump(self):
		print 'DSO details:'
		print 'name:', self.name
		print 'fileOffset:', self.fileOffset
		print 'dependentLibs :', self.dependentLibs
		print ''
		print '	ELF Details:'
		if self.elfFile != None:
			print 'elfFile:', self.elfFile.dump()
		print ''
			
class deploymentConfig:
	__filename		= ''	# filename with path
	__config		= None 	# Dictionary to hold deployment config
	deviceName		= ''
	partitionList	= None # Global List of all Partitions
	dsoList			= None # Global List of all DSOs
	appList			= None # Global List of all APPs
	deployList		= None
	bypassPrelink	= False # Flag to bypass the prelinker requirements
	

	def __init__(self, file, bypassPrelink):
		self.__filename = file
		self.partitionList = []
		self.appList = []
		self.deployList = []
		self.dsoList = []
		self.bypassPrelink = bypassPrelink
		
	def parseFile(self):
		if os.path.isfile(self.__filename) != True:
			print 'Deployment Configuration file not found'
			return -1
		with open(self.__filename, 'r') as fd:
			self.__config = json.load(fd)
		
		#get deviceName
		if 'deviceName' in self.__config:
			self.deviceName = self.__config['deviceName']
		else:
			print 'deviceName object not present in deployment file'
			return -40
			
		dev = device(self.deviceName)
		if dev == None:
			print 'Error: Unsupported device:', self.deviceName
			return -41

		#get Partitions
		if 'partitions' in self.__config:
			for part in self.__config['partitions']:
				if part.has_key('name') != True:
					print 'ERROR: No "name" key found in partition'
					return -2					
				if part.has_key('vaddr') != True:
					print 'ERROR: No "vaddr" key found in partition'
					return -3 
				if (not(self.bypassPrelink) and (part.has_key('paddr') != True)):
					print 'ERROR: No "paddr" key found in partition'
					return -4 		
				if part.has_key('size') != True:
					print 'ERROR: No "size" key found in partition'
					return -5
					
				if part.has_key('priority') == True:
					priority = part['priority']
				else:
					priority = 0				

				if part.has_key('loadPartition') == True:
					load = part['loadPartition']
				else:
					load = False
				if self.bypassPrelink:
					if not load:
						print ('Warning: ignoring partition ',part['name'],
							   'only load partition definition is needed in prelink bypass mode')
					else:
						partObj = partition(part['name'], None, part['vaddr'],
											part['size'], True, priority,
											dev, self.bypassPrelink)
				else:
					partObj = partition(part['name'], part['paddr'],
										part['vaddr'], part['size'], load,
										priority, dev, self.bypassPrelink)
				
				if part.has_key('secNamePat') == True:
					for secName in part['secNamePat']:
						partObj.addSectionPattern(secName)
						
				if not self.bypassPrelink:
					if part.has_key('cores') != True:
						print 'ERROR: No "cores" key found in partition'
						return -6
					for core in part['cores']:
						if partObj.addCore(core) != True:
							return -7
							
				if not self.bypassPrelink:
					if part.has_key('permissions') != True:
						print 'ERROR: No "permissions" key found in partition'
						return -8
					permObj = permission()
					for attr in part['permissions']:
						if permObj.setPermission(attr, True) != True:
							return -9
					if partObj.addPermissions(permObj) != True:
						return -10
				
				if part.has_key('cacheEnable') != True:
					__cacheEnable = True
				else:
					__cacheEnable = part['cacheEnable']
					
				if part.has_key('prefetch') != True:
					__prefetchEn = False
				else:
					__prefetchEn = part['prefetch']

				if not self.bypassPrelink:
					if part.has_key('shared') != True:
						print 'ERROR: No "shared" key found in partition'
						return -12
					
				if not self.bypassPrelink:
					if partObj.setMemAttr(__cacheEnable, __prefetchEn, part['shared']) != True:
						return -13
					
				self.partitionList.append(partObj)
		else:
			print 'partitions object not present in deployment file'
			return -14
			
		#get applications		
		if 'applications' in self.__config:
			libPath = None
			for app in self.__config['applications']:
				if app.has_key('name') != True:
					print 'ERROR: No "name" key found in applications'
					return -20					
				if app.has_key('fileName') != True:
					print 'ERROR: No "fileName" key found in applications'
					return -21 
				if not self.bypassPrelink:
					if app.has_key('libPath') != True:
						print 'ERROR: No "libPath" key found in applications'
						return -22		
				if app.has_key('allowedCores') != True:
					print 'ERROR: No "allowedCores" key found in applications'
					return -23				
				if os.path.isfile(app['fileName']) != True:
					print 'App file not found:', app['fileName']
					return -24
				if not self.bypassPrelink:
					if os.path.isdir(app['libPath']) != True:
						print 'Lib Path not found:', app['libPath']
						return -25
					else:
						libPath = app['libPath']
					
				appObj = application(app['name'], app['fileName'], libPath,
									 appImagesDir, tmpDir, self.bypassPrelink)
				for core in app['allowedCores']:
					if appObj.addAllowedCore(core) != True:
						return -26						
				self.appList.append(appObj)
		else:
			print 'applications object not present in deployment file'
			return -25
			
		#get appDeployment
		if 'appDeployment' in self.__config:
			chip = device(self.deviceName)
			if len(self.__config['appDeployment']) != chip.numCores():
				print 'Invalid No. of cores in appDeployment'
				return -30
			for app in self.__config['appDeployment']:
				self.deployList.append(app)
		else:
			print 'appDeployment object not present in deployment file'
			return -31	
		return 0
		#END: parseFile()

				
	def getPartitionList(self):
		return self.partitionList
		
	def getAppList(self):
		return self.appList

	def getDsoList(self):
		return self.dsoList
		
	def getAppDeploymentCfg(self):
		return self.deployList
		
	def getDeviceName(self):
		return self.deviceName

	
# ELF File Classes
class elfHdr:
	phnum	= 0
	shnum	= 0

	def __init__(self, phnum, shnum):
		self.phnum	= phnum
		self.shnum	= shnum
	
	def dump(self):
		print 'phnum:', self.phnum
		print 'shnum:', self.shnum
		
class section:
	name	= ''
	elf	= None	# Parent elfFile object 
	type	= ''
	flags	= None
	addr	= 0
	offset	= 0
	fsize	= 0
	align	= 0 
	segment	= None

	def __init__(self, name, elf):
		self.name = name
		self.elf = elf
		self.flags = []
	
	def setAttr(self, type, addr, offset, size, align):
		self.type = type
		self.addr = hex2dec(addr)
		self.offset = hex2dec(offset)
		self.fsize = hex2dec(size)
		self.align = hex2dec(align)
	
	def addFlag(self, flag):
		self.flags.append(flag)
	
	def addSegment(self, seg):
		if isinstance(seg,segment)!=True:
			print 'addSegment: Invalid input - Not a segment'
			return False
		self.segment = seg
		return True
		
	def getAddr(self):
		return self.addr
		
	def getOffset(self):
		return self.offset
		
	def getSize(self):
		return self.fsize
		
	def getElf(self):
		return self.elf

	def getSegment(self):
		return self.segment
				
	def dump(self):
		print 'name:', self.name
		print 'type:', self.type
		print 'addr:', dec2hex(self.addr)
		print 'offset:', dec2hex(self.offset)			
		print 'fsize:', dec2hex(self.fsize)
		print 'align:', dec2hex(self.align)
		if self.segment != None:
			segIdx = self.segment.getIdx()
		else:
			segIdx = None
		print 'segment:', segIdx
		print 'elf:', self.elf
		
class segment:
	idx		= 0 	# PHT index in the Elf File
	elf		= None	# Parent elfFile object 
	type	= ''
	offset	= 0
	vaddr	= 0
	paddr	= 0
	filesz	= 0
	memsz	= 0
	align	= 0
	flags	= 0
	partition = None	# Associated partition
	modifiedVaddr = 0	# Modified vaddr calculated by MAP tool

	def __init__(self, idx, elf):
		self.idx = idx
		self.elf = elf
		self.flags = []

	def isXIP(self):
		return self.partition.isLoadPartition()
		
	def setModVaddr(self, vaddr):
		self.modifiedVaddr = vaddr

	def getModVaddr(self):
		return self.modifiedVaddr
		
	def getVaddr(self):
		return self.vaddr
		
	def setAttr(self, type, offset, vaddr, paddr, filesz, memsz, align):		
		self.type = type
		self.offset = hex2dec(offset)
		self.vaddr = hex2dec(vaddr)
		self.paddr = hex2dec(paddr)
		self.filesz = hex2dec(filesz)
		self.memsz = hex2dec(memsz)
		self.align	= hex2dec(align)

	def getFileOffset(self):
		return self.offset
		
	def getPermissionAttrs(self):
		perm = permission()
		for flag in self.flags:
			if flag == 'PF_R':
				perm.setPermission('SR', True)
				perm.setPermission('UR', True)
			if flag == 'PF_W':
				perm.setPermission('SW', True)
				perm.setPermission('UW', True)
			if flag == 'PF_X':
				perm.setPermission('SX', True)
				perm.setPermission('UX', True)
		return perm

	def isLoadable(self):
		if self.type == 'PT_LOAD':
			return True
		else:
			return False
			
	def getElf(self):
		return self.elf
	
	def getIdx(self):
		return self.idx
		
	def getPartition(self):
		return self.partition
		
	def getAlignment(self):
		return self.align

	def getMemSize(self):
		return self.memsz

	def getFileSize(self):
		return self.filesz
		
	def addFlag(self, flag):
		self.flags.append(flag)
		
	def addPartition(self, part):
		if isinstance(part,partition)!=True:
			print 'addPartition: Invalid input - Not a partition'
			return False
		self.partition = part
		return True
		
	# Checks if the section belongs to segment
	def containsSection(self, sec):
		if isinstance(sec,section)!=True:
			print 'containsSection: Invalid input - Not a section'
			return False
		if sec.getElf() != self.elf:
			print 'containsSection: different Elf'
			return False
		secVaddr = sec.getAddr()
		#TODO: check if this would be a constraint
		if secVaddr == 0:
			return False
		if (secVaddr < self.vaddr):
			return False
		if (secVaddr >= (self.vaddr + self.memsz)):
			return False
		return True
		
	def flagsToPerm(self):
		perm = permissions()
		for flag in self.flags:
			if flag == 'PF_R':
				perm.setPermission('SR', True)
			if flag == 'PF_W':
				perm.setPermission('SW', True)
			if flag == 'PF_X':
				perm.setPermission('SX', True)
		return perm
		
	def dump(self):
		print 'idx:', self.idx
		print 'type:', self.type
		print 'vaddr:', dec2hex(self.vaddr)
		print 'paddr:', dec2hex(self.paddr)
		print 'offset:', dec2hex(self.offset)		
		print 'filesz:', dec2hex(self.filesz)
		print 'memsz:', dec2hex(self.memsz)
		print 'align:', dec2hex(self.align)
		print 'flags:', self.flags
		print 'elf:', self.elf
		pName = None
		if self.partition != None:
			pName = self.partition.getName()
		print 'partition:', pName
		print 'ModVaddr:', dec2hex(self.modifiedVaddr)
		
class elfFile:
	file	= ''
	hdr		= None	# Elf Header
	phList	= None	# List of Program Headers
	secList	= None	# List of Sections (python dictionary)
	soname	= ''	# value of DT_SONAME in the dynamic section of the ELF File
	depLib	= None	# List of name of dependent Libraries
	xmlFileObj = None
	xmlFileName = ''
	staticBase = None # value of __TI_STATIC_BASE from the .dynsym section of the ELF file

	def __init__(self, file):
		self.file = file
		self.phList = []
		self.secList = dict()
		self.depLib = []
		# Need to run ofd6x -x on the Elf file and get the XML output  
		self.xmlFileObj = tempfile.NamedTemporaryFile(suffix=".xml", delete=False)
		self.xmlFileName = self.xmlFileObj.name

	# Returns the list of segment instances containing the given section name regular expression.
	# Section name should have a valid python regular expression syntax.
	def getSegFromSec(self, reSecName):
		segList = []
		for k,v in self.secList.items():
			if re.search(reSecName,k):
				seg = v.getSegment()
				if seg not in segList:
					segList.append(seg)
		return segList
	
	def getXIPSegment(self):				
		for seg in self.phList:
			if seg.isLoadable():
				if seg.isXIP():
					return seg
		return None
		
	def getSegments(self):				
		return self.phList

	def getSegByIdx(self, idx):
		for seg in self.phList:
			if seg.getIdx() == idx:
				return seg
		return None

	# Get the segment containing the symbol __TI_STATIC_BASE
	def getStaticBaseSegment(self):
		if not self.staticBase:
			return None
		for seg in self.phList:
			segBase = seg.getVaddr()
			segEnd = segBase + seg.getMemSize()
			if ((self.staticBase >= segBase) and (self.staticBase < segEnd)):
				return seg
		return None

	def getLoadableSegments(self):
		segList = []
		for seg in self.phList:
			if seg.isLoadable():
				segList.append(seg)
		return segList
		
	def getSoname(self):
		return self.soname
		
	def getDepLib(self):
		return self.depLib
		
	def __setSoname(self, name):
		self.soname = name
		return True
	
	def getStaticBase(self):
		return self.staticBase

	def __setStaticBase(self, DP):
		self.staticBase = DP
		return True

	def __addDepLib(self, deplib):
		self.depLib.append(deplib)
		return True
		
	def __addElfHdr(self, hdr):
		if isinstance(hdr,elfHdr)!=True:
			return False
		self.hdr = hdr
		return True

	def __addSegment(self, hdr):
		if isinstance(hdr,segment)!=True:
			return False
		self.phList.append(hdr)
		return True

	def __addSection(self, sec, name):
		if isinstance(sec,section)!=True:
			return False
		self.secList[name] = sec
		return True

	def parse(self):
		__ofdarg = '-x ' + '-o ' + self.xmlFileName + ' ' + '"' + self.file + '"'
		executeShellCmd(ofdTool,__ofdarg)
		from xml.etree.ElementTree import ElementTree as ET
		root = ET(file=self.xmlFileName)
		
		#Create tree
		tree = root.parse(self.xmlFileName)
		
		# Parse Elf Header
		for element in tree.findall('object_file/elf/elf32_ehdr'):
			for subelem in element:
				if subelem.tag == 'e_shnum':
					e_shnum = subelem.text
				if subelem.tag == 'e_phnum':
					e_phnum = subelem.text
		eHdr = elfHdr(int(e_phnum, 16), int(e_shnum, 16))
		self.__addElfHdr(eHdr)

		# Parse Program Header Table
		idx = 0
		for element in tree.findall('object_file/elf/program_table/elf32_phdr'):
			pHdr = segment(idx, self)
			for subelem in element:
				if subelem.tag == 'p_type':
					p_type = subelem.text
				if subelem.tag == 'p_offset':
					p_offset = subelem.text
				if subelem.tag == 'p_vaddr':
					p_vaddr = subelem.text
				if subelem.tag == 'p_paddr':
					p_paddr = subelem.text
				if subelem.tag == 'p_filesz':
					p_filesz = subelem.text				
				if subelem.tag == 'p_memsz':
					p_memsz = subelem.text
				if subelem.tag == 'p_align':
					p_align = subelem.text
				if subelem.tag == 'p_flags':
					for flag in subelem:
						pHdr.addFlag(flag.text)
			pHdr.setAttr(p_type, p_offset, p_paddr, p_paddr, p_filesz, p_memsz, p_align)
			self.__addSegment(pHdr)
			idx = idx + 1
			
		for element in tree.findall('object_file/elf/section_table/section'):
			shdr = element.find('elf32_shdr')
			for subelem in shdr:
				if subelem.tag == 'sh_name_string':
					sh_name = subelem.text
				if subelem.tag == 'sh_type':
					sh_type = subelem.text			
				if subelem.tag == 'sh_addr':
					sh_addr = subelem.text
				if subelem.tag == 'sh_offset':
					sh_offset = subelem.text
				if subelem.tag == 'sh_size':
					sh_size = subelem.text				
				if subelem.tag == 'sh_addralign':
					sh_align = subelem.text

			# Skip SHT_NULL sections
			if sh_name == None:
				continue					
			sec = section(sh_name, self)
			sec.setAttr(sh_type, sh_addr, sh_offset, sh_size, sh_align)
			
			# If .dynamic section then retrieve the required Dynamic info
			if sh_type == 'SHT_DYNAMIC':
				for dynElem in element.find('dynamic_table'):
					dynList = list(dynElem)
					if dynList[0].text == 'DT_SONAME':
						soname = dynList[2].text
						self.__setSoname(soname)
					if dynList[0].text == 'DT_NEEDED':
						depLib = dynList[2].text
						self.__addDepLib(depLib)				
			
			# If .dynsym section then retrieve value for __TI_STATIC_BASE
			if sh_type == 'SHT_DYNSYM':
				for dynElem in element.find('symbol_table'):
					dynList = list(dynElem)
					if dynList[2].text == '__TI_STATIC_BASE':
						staticBase = dynList[3].text
						self.__setStaticBase(int(staticBase, 16))

			self.__addSection(sec, sh_name)
			# Create Section-to-Segment binding
			for seg in self.phList:
				if seg.containsSection(sec):
					sec.addSegment(seg)
		return 0

	def getFile(self):
		return self.file
		
	def dump(self):
		print 'file:', self.file
		print 'soname:', self.soname
		print 'depLib:', self.depLib
		print 'staticBase:', dec2hex(self.staticBase)
		print 'Program Header Table: '
		print ' '
		for i in range(self.hdr.phnum):
			self.phList[i].dump()
			print ' '
		print 'Section List: '
		for i in self.secList:
			self.secList[i].dump()
			print ' '

################################################################################
# MAP Tool processing
################################################################################
	
def doMaptoolProcessing(aList, libDict, pList, coreList, fileSystemDir, d, imageDir):
	"""Does the MAP tool processing"""
	errorCode = None

	# Do segment-to-partition mapping for each partition
	# for all the segments in APP's identified in the partition
	for p in pList:
		# Store DDR Load partition for future use
		if p.isLoadPartition():
			xipPartition = p
		for a in aList:
		# Check if the partition is valid for the APP
			aCoreSet = a.getAllowedCoreSet()
			pCoreSet = p.getCoreSet()
			if aCoreSet.issubset(pCoreSet) != True:
				continue
			#Check if the Application has any matching segments identified in the partition
			secReList = p.getSectionPattern()
			pSegList = []
			for secRe in secReList:
				segList = a.getSegFromSec(secRe)
				for seg in segList:
					if seg==None:
						continue
					if seg.isLoadable() != True:
						continue
					if seg not in pSegList:
						pSegList.append(seg)
			# Add the segments to the partition
			for seg in pSegList:
				if p.addSegment(a.getName(), seg):
					seg.addPartition(p)
				else:
					print ('ERROR: Could not add segment:', seg.getIdx(),'app:',
						   a.getName(), 'to partition:', p.getName())
					errorCode = -1

	if errorCode != None:
		return (errorCode)

	# Scan all the segments in each APP to make sure it has been assigned to a partition
	for a in aList:
		aSegList = a.getSegments()
		for seg in aSegList:
			part = seg.getPartition()
			if seg.isLoadable() and part == None:		
				print 'ERROR: Unassigned segment found:', a.getName(), ':seg-idx:', seg.getIdx()
				errorCode = -2
			
	if errorCode != None:
		return (errorCode)

	# Do segment-to-partition mapping for each partition
	# for all the segments in DSO's identified in the partition
	for p in pList:
		for k,v in globalLibList.items():
			#Check if the DSO has any matching segments identified in the partition
			secReList = p.getSectionPattern()
			pSegList = []
			for secRe in secReList:
				segList = v.getSegFromSec(secRe)
				for seg in segList:
					if seg.isLoadable() != True:
						continue
					if seg not in pSegList:
						pSegList.append(seg)
			# Add the segments to the partition
			for seg in pSegList:
				if p.addSegment(k, seg):
					seg.addPartition(p)
				else:
					print 'ERROR: Could not add segment to partition'
					errorCode = -3
	
	if errorCode != None:
		return (errorCode)

	# Scan all the segments in each DSO to make sure it has been assigned to a partition
	for k,v in globalLibList.items():
		dSegList = v.getSegments()
		for seg in dSegList:
			part = seg.getPartition()
			if seg.isLoadable() and part == None:		
				print 'ERROR: Unassigned segment found:', v.getName(), ':seg-idx:', seg.getIdx()
				errorCode = -4
				
	if errorCode != None:
		return (errorCode)
	
	#Add malLoader/nml to the Filesystem
	loadImageFs = fileSystem(fileSystemDir, xipPartition.getVaddr())
	errorCode = addLoaderToFs(loadImageFs)
	if errorCode != None:
		return (-5)
	
	# Add APP/DSO Elf files to the filesystem
	errorCode = addExeToFs(loadImageFs,aList,globalLibList, None, False)
	
	# Check for errors adding ELF Files to the File System
	if errorCode != None:
		return(-6)
		
	# Do virtual address assignment for all Loadable segments
	errorCode = assignVaddrToSeg(pList,aList,globalLibList,loadImageFs)
	
	# Check for errors while doing virtual address assignment			
	if errorCode != None:
		return(-7)	
	
	# Run Prelinker
	if runPrelinker(aList, globalLibList, prelinkCmdFileName, fileSystemDir) != 0:
		print 'ERROR: Prelinker run pass-1 failed'
		return(-8)
	
	# Since Prelinker can change the size of the ELF files
	# Need to redo the vaddr assignment steps for XIP segments 
	# Assumption is that offsets of LOAD segments have not changed in the ELF file
	# Not a valid assumption unless PT_DYNAMIC is the last segment in an ELF file
	
	# Add APP/DSO Elf files to the filesystem
	loadImageFs2 = fileSystem(fileSystemDir, xipPartition.getVaddr())
	errorCode = addLoaderToFs(loadImageFs2)
	if errorCode != None:
		return(-9)
		
	errorCode = addExeToFs(loadImageFs2,aList,globalLibList,fileSystemDir, False)
	
	# Check for errors adding ELF Files to the File System
	if errorCode != None:
		return(-10)
		
	# Do virtual address assignment for all Loadable segments
	errorCode = assignVaddrToSeg(pList,aList,globalLibList,loadImageFs2)
	
	# Check for errors while doing virtual address assignment			
	if errorCode != None:
		return(-11)	
	
	# Run Prelinker - Second Pass
	if runPrelinker(aList, globalLibList, prelinkCmdFileName, fileSystemDir)!= 0:
		print 'ERROR: Prelinker run pass-2 failed'
		return(-12)	
	
	# Generate Application activation Records
	arFileList = genArRecords(aList, coreList, fileSystemDir, d, loadImageFs2,
							  False)
		
	# Add activation records to filesystem
	errorCode = addArToFs(loadImageFs2, arFileList)
	
	if errorCode != None:
		return(-13)	

	#Add deployment configuration to the Filesystem
	errorCode = genAppDeploymentFileBin(dList, loadImageFs2)
	
	if errorCode != None:
		return(-14)	

	# Generate Filesystem Image
	loadImageFs2.genFsImage(LoadImageName)
	
	# Generate CCS GEL file for symbolic debugging
	__dsoList = []
	for name,obj in libDict.items():
		__dsoList.append(obj)
	genGelFile(imageDir, aList, __dsoList)

	# Write out file offsets in the file systems
	loadImageFs2.dumpFileoffsets(fsOffsetsFileName)
	
	return None
#END: doMaptoolProcessing()

###############################################################################
# Processing for prelinker bypass mode
###############################################################################
def doBypassPrelinkProcessing(aList, pList, coreList, fileSystemDir, device):
	"""Creates a ROMFS image with executables bypassing the Prelinker"""
	errorCode = None
	loadPartition = None

	#Get the load partition address
	for p in pList:
		if p.isLoadPartition():
			loadPartition = p

	if not loadPartition:
		print ('ERROR: no load partition specified')
		return -1;

	#check if any of the application segment lies in the load partition
	pStartAddr = loadPartition.getVaddr()
	pEndAddr = loadPartition.getSize() + pStartAddr

	for a in aList:
		sList = a.getSegments()
		for s in sList:
			vaddr = s.getVaddr()
			if ((vaddr >= pStartAddr) and (vaddr < pEndAddr)):
				#Error if this segment has initilaized data
				if (s.getFileSize() > 0):
					print ('ERROR: Loadable Segment lies in load partition app:', a.getName(), 'seg-idx:', s.getIdx())
					return -2;
				else:
					print ('Warning: Segment lies in load partition app:', a.getName(), 'seg-idx:', s.getIdx())

	#Add malLoader/nml to the Filesystem
	loadImageFs = fileSystem(fileSystemDir, loadPartition.getVaddr())
	errorCode = addLoaderToFs(loadImageFs)
	if errorCode != None:
		return (-3)
	
	# Add APP Elf files to the filesystem
	errorCode = addExeToFs(loadImageFs, aList, None, None, True)

	# Check for errors adding ELF Files to the File System
	if errorCode != None:
		return(-4)

	# Generate Application activation records
	arFileList = genArRecords(aList, coreList, fileSystemDir, device,
							  loadImageFs, True)

	# Add activation records to filesystem
	errorCode = addArToFs(loadImageFs, arFileList)

	if errorCode != None:
		return(-5)	

	# Add deployment configuration to the Filesystem
	errorCode = genAppDeploymentFileBin(dList, loadImageFs)

	if errorCode != None:
		return(-6)	

	# copy all stripped executables to the filesystem directory
	for app in aList:
		__name = app.getName()
		__sname = app.getStrippedFileName()
		copyFile(__sname, os.path.join(fileSystemDir,__name))
		
	# Generate Filesystem Image
	loadImageFs.genFsImage(LoadImageName)

	# Write out file offsets in the file systems
	loadImageFs.dumpFileoffsets(fsOffsetsFileName)

	return None
#END: doBypassPrelinkProcessing()
	
###############################################################################
# Main
###############################################################################

errorCode = None
bypassPrelink = False

if (len(sys.argv) < 2):
	print 'USAGE:', sys.argv[0], '<map tool cfg file name>'
	sys.exit(-1)
	
if (len(sys.argv) > 2):
	if sys.argv[2] == "bypass-prelink":
		bypassPrelink = True
		print 'MAP tool executing in prelink bypass mode'

mapCfg = mapToolCfg(sys.argv[1])
if mapCfg.parseFile()!= 0:
	print 'Error in MAP Tool config file'
	sys.exit(-2)

#configurations
deploymentCfgFile = mapCfg.getDeploymentCfgFile()
fileSystemDir = mapCfg.getFileSystemDir()
activationRecordsDir = mapCfg.getActivationRecordsDir()
LoadImageName = mapCfg.getLoadImageName()
prelinkCmd = mapCfg.getPrelinkCmd()
ofdTool = mapCfg.getOfdTool()
malLoader = mapCfg.getMalLoader()
nmlLoader = mapCfg.getNmlLoader()
prelinkCmdFileName = mapCfg.getPrelinkCmdFileName()
fsOffsetsFileName = mapCfg.getfsOffsetsFileName()
stripCmd = mapCfg.getStripCmd()
appImagesDir = mapCfg.getAppImagesDir()
tmpDir = mapCfg.getTmpDir()
imageDIr = mapCfg.getImageDir()

dc = deploymentConfig(deploymentCfgFile, bypassPrelink)
if (dc.parseFile() != 0):
	sys.exit(-3)

# Create Partition List
pList = dc.getPartitionList()

# Create App List
aList = dc.getAppList()
dList = dc.getAppDeploymentCfg()
chip = dc.getDeviceName()
d = device(chip)
globalLibList = dict() # Global List of shared libraries

# Process Elf file for each APP
for a in aList:
	if a.processElf(globalLibList) != 0:
		print 'ERROR: Process Elf failed'
		errorCode = -4

if errorCode != None:
	sys.exit(errorCode)

# Create Core List
coreList = []
for i in range(d.numCores()):
	c = core(i)
	c.initPartitionList(pList)
	coreList.append(c)
	#c.dump()

if not bypassPrelink:
	doMaptoolProcessing(aList, globalLibList, pList, coreList, fileSystemDir, d, imageDIr)
else:
	doBypassPrelinkProcessing(aList, pList, coreList, fileSystemDir, d)

# Debug Dumps
# Print Partition List
#for p in pList:
#	p.dump()

# Print Application List
#for a in aList:
#	a.dump()	

# Print Library List
#print 'Printing globalLibList:'
#for lib in globalLibList:
#	globalLibList[lib].dump()
	
# Print FileSystem Info	
#print 'Print Filesystem Information:'
#loadImageFs.dump()
#loadImageFs2.dump()


