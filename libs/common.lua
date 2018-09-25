local M = {}

M.HASHES = require "libs.hashes"
M.MSG = require "libs.msg_receiver"

M.GLOBAL = {} 

--region input
M.INPUT = require "libs.input_receiver"
function M.input_acquire(url)
	M.INPUT.acquire(url)
end

function M.input_release(url)
	M.INPUT.release(url)
end
--endregion

--region log
M.LOG = require "libs.log"

function M.t(message, tag)
	M.LOG.t(message, tag)
end

function M.trace(message, tag)
	M.LOG.trace(message,tag)
end

function M.d(message, tag)
	M.LOG.d(message,tag)
end

function M.debug(message, tag)
	M.LOG.debug(message,tag)
end

function M.i(message, tag)
	M.LOG.i(message,tag)
end

function M.info(message, tag)
	M.LOG.info(message,tag)
end

-- WARNING
function M.w(message, tag)
	M.LOG.w(message,tag)
end

function M.warning(message, tag)
	M.LOG.warning(message,tag)
end

-- ERROR
function M.e(message, tag)
	M.LOG.e(message,tag)
end

function M.error(message, tag)
	M.LOG.error(message,tag)
end

-- CRITICAL
function M.c(message, tag)
	M.LOG.c(message,tag)
end

function M.critical(message, tag)
	M.LOG.critical(message,tag)
end
--endregion

return M