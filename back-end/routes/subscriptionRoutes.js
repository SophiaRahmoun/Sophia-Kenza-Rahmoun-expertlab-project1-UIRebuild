import express from "express";
import verifyToken from "../middleware/verifyToken.js";
import User from "../models/User.js";

const router = express.Router();

router.post("/", verifyToken, async (req, res) => {
  const { subscription } = req.body;

  try {
    const user = await User.findByIdAndUpdate(
      req.user.userId,
      { subscription },
      { new: true }
    );
    res.json({ subscription: user.subscription });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

router.get("/", verifyToken, async (req, res) => {
  try {
    const user = await User.findById(req.user.userId);
    res.json({ subscription: user.subscription });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

export default router;