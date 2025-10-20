import express from "express";
import verifyToken from "../middleware/verifyToken.js";
import History from "../models/History.js";

const router = express.Router();

router.post("/", verifyToken, async (req, res) => {
	const { bikeId, distance, rating } = req.body;

	try {
		const history = new History({
			userId: req.user.userId,
			bikeId,
			distance,
			rating,
		});
		await history.save();
		res.status(201).json(history);
	} catch (err) {
		res.status(500).json({ message: err.message });
	}
});

router.get("/", verifyToken, async (req, res) => {
	try {
		const history = await History.find({ userId: req.user.userId });
		res.json(history);
	} catch (err) {
		res.status(500).json({ message: err.message });
	}
});

router.get("/average/:bikeId", async (req, res) => {
	const { bikeId } = req.params;

	try {
		const stats = await History.aggregate([
			{ $match: { bikeId } },
			{
				$group: {
					_id: "$bikeId",
					avgRating: { $avg: "$rating" },
					totalDistance: { $sum: "$distance" },
				},
			},
		]);
		res.json(stats[0] || {});
	} catch (err) {
		res.status(500).json({ message: err.message });
	}
});

export default router;
