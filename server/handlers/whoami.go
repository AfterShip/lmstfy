package handlers

import (
	"github.com/gin-gonic/gin"
	"net/http"
)

// GET /whoami
func Healthz(c *gin.Context) {

	c.Status(http.StatusOK)
}
