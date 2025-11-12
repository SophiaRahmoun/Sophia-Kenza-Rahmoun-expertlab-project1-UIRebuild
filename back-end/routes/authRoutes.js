import express from "express";
//import { register, login } from "../controllers/authController";
import User from "../models/User.js";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
import verifyToken from "../middleware/verifyToken.js";

const router = express.Router();
router.post("/register", async (req, res) => {
	const { username, password } = req.body;

	if (!username || !password)
		return res.status(400).json({ message: "Missing fields" });

	const existingUser = await User.findOne({ username });
	if (existingUser)
		return res.status(409).json({ message: "User already exists" });

	const hashedPassword = await bcrypt.hash(password, 10);
	const newUser = new User({ username, password: hashedPassword });

	await newUser.save();

	const token = jwt.sign({ userId: newUser._id }, process.env.JWT_SECRET, {
		expiresIn: "7d",
	});

	res.status(201).json({ token, userId: newUser._id });
});

router.post("/login", async (req, res) => {
	try {
	console.log("Login:", req.body);

	const { username, password } = req.body;
	if (!username || !password)
		return res.status(400).json({ message: "Missing fields" });

	const user = await User.findOne({ username });
	if (!user) return res.status(404).json({ message: "User not found" });

	const isMatch = await bcrypt.compare(password, user.password);
	if (!isMatch) return res.status(401).json({ message: "Invalid credentials" });

	const token = jwt.sign({ userId: user._id }, process.env.JWT_SECRET, {
		expiresIn: "7d",
	});

	res.status(201).json({
		id: user._id,
		username: user.username,
		email: user.email || "",
		token,
	});
	} catch (err) {
		console.error("Login error:", err);
		res.status(500).json({ message: "Server error", error: err.message });
	}

});

router.get("/", (req, res) => {
	res.send("API Auth workss !");
});

export default router;
